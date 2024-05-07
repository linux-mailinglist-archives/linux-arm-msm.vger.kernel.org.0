Return-Path: <linux-arm-msm+bounces-19438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C19328BF146
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 01:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CF1E286B2C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 23:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D782B7F476;
	Tue,  7 May 2024 23:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NyJ57G1l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AC683CD2;
	Tue,  7 May 2024 23:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715123123; cv=none; b=jQYaApNEByzKTQO35db76sBbayg+ha1ixYbFTsnQCVuyfCac3t2FAGi1gXnVDZIbkKX0EKUCCI3WIkugyf2yzJETwCMURQ/SvwL3IPa+voO9U5MmTwAx+4wc7zKLzOSlZdxO1fuJxRFJd3lTonBfgrrwL21lXlQcqo0QvEs/NcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715123123; c=relaxed/simple;
	bh=jvuUv/gpzsuOrwEs/4QwZfNNTb8zlGmd4Bztr7m2hVE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dRitLiboM584YxIcpV9vP9RL7kZuV42jbA57vCL99aGQmmTXEh9izj+9R743O8shtQjPmszCx8oKO829FVZfUNl9kPun4PCjx2G+KYPSIN20HPKE6dy6OInQQDH4YwqS3MKrenxITSAJb8/oFo7s0e21ulAWGvmjQRT+mHJPY0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NyJ57G1l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 447Mnk35030488;
	Tue, 7 May 2024 23:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=Y7avjRX
	egUR08hpaeu4He6mA5avWecSvWCQx3d/eSM0=; b=NyJ57G1lOu7KXx4mI+eW521
	tocoYcGPbL5xIkV0/GvcjE1K58e94AO/Gs3n3WCLAHZLHfGGqySdP9AKf5HFPflf
	ktsR5cvZ7Ab+nSr5vcHHhQXD8VLepsv2x3zGPCyEbAJIj3Zj3qfT9XzVhN4TzGgx
	nHAbVFfVLihj3hUIIjy08ieiJSUgbhDC20a3s0KS1XWgCp2gfhUhGTGtL6ePgurQ
	G36+7vDcqggM61lwJIMK3JgTGC1hChs24N2s1n8A2AURBGa1wpQr5RIYe0XIe3hw
	X2wn5x4AMWQ4/fSlxYwDwKT3ICYQmEFRaSBGqM4tIO4K02/tbgN5RzMKgioeKzg=
	=
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xysprrej1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 23:05:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 447N596w005521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 May 2024 23:05:09 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 May 2024 16:05:08 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/msm: remove python 3.9 dependency for compiling msm
Date: Tue, 7 May 2024 16:04:40 -0700
Message-ID: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DZg-dTmM5wmBFPryQnwiSe4krGJvwrJh
X-Proofpoint-ORIG-GUID: DZg-dTmM5wmBFPryQnwiSe4krGJvwrJh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_15,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405070161

Since commit 5acf49119630 ("drm/msm: import gen_header.py script from Mesa"),
compilation is broken on machines having python versions older than 3.9
due to dependency on argparse.BooleanOptionalAction.

Switch to use simple bool for the validate flag to remove the dependency.

Fixes: 5acf49119630 ("drm/msm: import gen_header.py script from Mesa")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/registers/gen_header.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
index fc3bfdc991d2..3926485bb197 100644
--- a/drivers/gpu/drm/msm/registers/gen_header.py
+++ b/drivers/gpu/drm/msm/registers/gen_header.py
@@ -538,7 +538,7 @@ class Parser(object):
 		self.variants.add(reg.domain)
 
 	def do_validate(self, schemafile):
-		if self.validate == False:
+		if not self.validate:
 			return
 
 		try:
@@ -948,7 +948,8 @@ def main():
 	parser = argparse.ArgumentParser()
 	parser.add_argument('--rnn', type=str, required=True)
 	parser.add_argument('--xml', type=str, required=True)
-	parser.add_argument('--validate', action=argparse.BooleanOptionalAction)
+	parser.add_argument('--validate', default=False, action='store_true')
+	parser.add_argument('--no-validate', dest='validate', action='store_false')
 
 	subparsers = parser.add_subparsers()
 	subparsers.required = True
-- 
2.44.0


