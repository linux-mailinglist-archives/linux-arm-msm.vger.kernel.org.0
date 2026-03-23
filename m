Return-Path: <linux-arm-msm+bounces-99433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNJXAjDGwWlTWQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:01:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 303712FEB65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:01:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDEC030B2F5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1F1384234;
	Mon, 23 Mar 2026 22:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iL0liLYo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUKQvmUz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED7437FF66
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774306604; cv=none; b=R15ZPzROpLLrEznpp0oSmXnZY0WtYtvtpGoR2Uio5VwU/KC0MLvQw2yzNHVkKciYxzmCMcFOocbHcli9ZGoeIWYE36lrzjDXqT//kUy+/+VNxy/lvA6eObZgMghKBAyQ8Vz6YTURDgUJOjfX4+oZAgWRrfrh97YI78kMJDftKTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774306604; c=relaxed/simple;
	bh=wmhP025rglUx7+8vVzUuIs8KYz9sx5JxJRsRX38iJbg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UH2R/Yce4MjXxS4xTMbRESjLwINtROBrxiBkMuN12goeRx2ymfp9Jh4J9r2+0WuttnUdBidMy1NEQDYzrfsYG7bwPZLJNBzcQc9yxZ4oZssoqwpVzzwqSdjJAIE6AEjyAZw2rWIOF7HJ//JJ6yadcRwfhqh0/AHU+oHNZOIEKn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iL0liLYo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cUKQvmUz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqXR73634280
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2ZstTuHl7bih1VkM7rz3Sd
	0l8JroL3oROjL1l70Xarc=; b=iL0liLYoa0URKVpCq/SQMfpuHcjmBXZm2VUUmH
	GqA3998hdoFYMpxGvk/nvKLljTVpK6tl55hZaWymyM/q853c2FECIqGg2Elzlh24
	hRKm6UMyfAvTXFoH7jxOhvSLKtO6Wu2uGAzl9JGIRgHHzgfLQM5qBUo7GoPTpSEH
	/FfaRcCHgdPX7CYKBzxQdt1copzxbF9N/3rBWWfqibg+R4shSZcCw0beS6GjHGJa
	GMQ06y/+lUv5/GXHGccXii7QBlgsJFPQ+Q8ozu1SBlmLk76DUgKS8NfwNSHim7GD
	3/rnFZMcVBTmpDCGUyaAfdeV9ltR16YdWOBFCHA2HSiEgd9w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4jbgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:56:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50917996cfaso56595681cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774306601; x=1774911401; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZstTuHl7bih1VkM7rz3Sd0l8JroL3oROjL1l70Xarc=;
        b=cUKQvmUz8kPjHPBOf+L3zc5fzkSnM5kuan/G+hcyyiEFJHbnOtgbqJ+jZ7O+IOQB5l
         8E2kLLyd7CRZLAxjAd39i63LRZuNUx5Hw2QS+UMikoeWjbimglISXLZ5MhaSmwsZlU/R
         yClh/KEFMDeuDT0VMfwaOO/IwKEWincElFcwuvudXgZUJRGTFxLkoI1hAtgtW3h3n6u1
         Mw/N9NoJlXxMLPTETq9afbyIMOb05clSUH1BbFK4Hq8+Ra9pbY5EBsugRZi2rBEPRiyI
         Xe9GLps055BfCvEF6m04z8L35gmHYb+YP2ehEjO/I3TmWjhZyHHGYYQ2SR+b9YPMzvss
         lWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774306601; x=1774911401;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZstTuHl7bih1VkM7rz3Sd0l8JroL3oROjL1l70Xarc=;
        b=paJw6h5FEVpu4fFtndwpoq5b6KcwEfXx6qjuyRHyy+ImpuJ7hffZp3MoJhOi4gszYX
         ScbRftCRVkPsMPScJaCy3qe2b/ywNGgBbvM5KUWoGIjD27zYVb85cgoql9Ll/qmKGXRB
         qCBet9Q6vTbM6EZAvt2y2E/XgxoYHcltgEHHigqCFveRbgEC6hLnre4NYURYQV8twtan
         +Ucl5SWHWcdVuCYPwx53OFwtJZonaCc/cmWQWJ0s+n+aFxWH8xlNr6RhRQD+MZHCbQSG
         EXIdjg5d4pu1pVpYEJ30OmMpe25Z376Yia1LZhIoB+4zuhHxMDpAI51PVqh5g1qpiUZN
         9Y4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZgmxSjNAyAbpHnNQwOCVSHj6x7gzEyO//zGdcCQekqW7TSjWsJXMztd3/IFQ3XAHx5d8nFrHstoTQHmwo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7jGJzpAeBYZUPR7mGqNnFMj+fTu74gq4KLlf0k6214p5iVBZ6
	M/IDXy2gvK//MLhe8D4mBwka9ws/cdzsyjHQkhDdIWMeVh9/5WBO1jTdTVgpzfzvjdD/ZzOV/xB
	z4Zq7XxYL4m9ssFmkY6zRFsHobBjeeyMJFfT8yFyi4fp4XXjH6Q5jhSo0jZ0rqAnqIXmPz0UdzO
	vH
X-Gm-Gg: ATEYQzwKvBDcTHcriCJJrz8bA7KnQswyEmv8ha8Cz3mc5waAuY3W2/MzUNVh5bzti3b
	j5uSjDHIBTm6DRkSzrtUIIyvvhldzeBN+o0sscd8uJjrXwq+JN0aXQS6FJJW7yFTRAx1f2MBcmI
	oC3vJmgh+oHIKo0bQ0KUEfDFn/eGlPFeqOYIVUMa4MrjLOpASsDZrHhN6Dux5pzpOq2wXA46MaH
	R7zJlfe/0B7f0E1GHzT/bTVijOds7CzKnpExoBbvPqh3+FOHxlEiTkRFVDgO86sIuRjMPKMQBRZ
	etd3Cio2gA7o/7wueOvJnJIN6nqOdahvSYKtGFcX8aDLO5izTZOPEPmxNg+UpEgysrMPBJZQiBy
	u74AcO5AKogJQYvwlNSwLt49YUPFjC8+u0iF8O6+TATJbuJbQKGq7pGHxQMa8AxGlEBa4WhRAUj
	oR5bBb9OekXL59jFurugDsMuGDABMCT9bFEbc=
X-Received: by 2002:a05:622a:5a88:b0:50b:4226:9250 with SMTP id d75a77b69052e-50b4226a527mr199416251cf.44.1774306601118;
        Mon, 23 Mar 2026 15:56:41 -0700 (PDT)
X-Received: by 2002:a05:622a:5a88:b0:50b:4226:9250 with SMTP id d75a77b69052e-50b4226a527mr199416041cf.44.1774306600639;
        Mon, 23 Mar 2026 15:56:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2963fa304sm156489e87.27.2026.03.23.15.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:56:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v7 0/4] drm/msm/hdmi & phy: use generic PHY framework
Date: Tue, 24 Mar 2026 00:56:33 +0200
Message-Id: <20260324-fd-hdmi-phy-v7-0-b41dde8d83b8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACLFwWkC/3XQTWrDMBAF4KsErSuj0Z/trnKP0oUsS5FobKUjV
 9QE371yIFBDuxl4A/PxmDvJDqPL5PV0J+hKzDHNNbQvJ2KDmS+OxrFmwhmXDFhP/UjDOEV6Cyu
 VcugE9H6wtiX14obOx++H9vZes8c00SWgM09DsJ53AKAFa4BDK6GnQKu34NoMBtccPlI5X+NsM
 DUJLzsbYl4Sro+ORe74TimmODvUKZLWhR2M0YqbsVXnlHPz+WWuNk1TUwfZWxX1JDQTII+EqoT
 qgHPjej2K4R9C/yaOTym6EtZ5yzqjlGzZH8S2bT+FqDUregEAAA==
X-Change-ID: 20240109-fd-hdmi-phy-44b8319fbcc7
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-phy@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4684;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wmhP025rglUx7+8vVzUuIs8KYz9sx5JxJRsRX38iJbg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwcUmgHLBp5eXLKQV/pwQik3PWswABr5/GgT8c
 /PkG0xp/hGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacHFJgAKCRCLPIo+Aiko
 1Q93B/9J9OPumurTq5B/6bIkP757/W//ayjgSu98QSIvQF2b2MDx2R1srj8w849Bri4eu1/g7bY
 Tt05hjT2ikV/thilJIv9LFpCqE/krjlnPNb/1PdEEPor1M4PZQx+yuk0pcGy2UIthcvD39LAsvi
 37MIJI97u6hdJCn6oIr3O0fal4IKvh6Qv23Cw24Xdnt6ehmacqxMybUqrcSBVHP1b5b9nOtFHdB
 hFnjU7nItBoEh1nNFdihIZPXhzCZeUow75A/YDtbGjxVL0t999eQNuEaeWts5G0FmHXyQKv2YUB
 t7xHd4LIthT+2YbPnnu2nZPLxKZbJtpQYGYWoLhDy5AjUyCV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: PP841Gc2ePybAJZrkVsIikyWPCgli604
X-Proofpoint-ORIG-GUID: PP841Gc2ePybAJZrkVsIikyWPCgli604
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c1c52a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=aG6DWvB8Nz23F0sxf60A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2OSBTYWx0ZWRfX+3Vv5dKlIlvg
 BnErpBB/VsQAN82LiYnYI2DuXJnunuQpN50iFV22WvsRwUuVD7YNsUv4wAUunn7EpQgY53jvfF5
 SOF3ONfZKBHCKPgp/SFRAatmo5XJs2RuzKkSLD/GkvSLrlkBcZPQ02Iq8/s981fS+WlRvTyFfpJ
 2osRxYX8Gf9j2bSDpo/GR5wfzD6/RfTElTDKNZ5OVo6yTMxoPFe7UAIrhE5zfx1Q6KLnkxCJzZv
 bNyOKx7qazvmTuKRaz7wSv/2h1y7zAJ0hYBjXsUaZUVvPJbbM/p7z19ruz5MRSJB6neMdlS9VNo
 Dn7Xeb61f9hiXnB3Nizmn+ni0qo+f9X3rT5kmWAK9RHwOp2Qj8v8XgH7+yYOwLymdO1iUwZbYY5
 kxoIbgh3E3mKZsZzA9iVWYo3r4DSH1LbiQaqCYDF8kK1Ow8s/CvxkvuQY9co2NjckCpf52GfP+2
 dqp3TV1fPiK8MRcXv+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230169
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99433-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 303712FEB65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The MSM HDMI PHYs have been using the ad-hoc approach / API instead of
using the generic API framework. Move MSM HDMI PHY drivers to
drivers/phy/qualcomm and rework them to use generic PHY framework. This
way all the QMP-related code is kept at the same place.
Also MSM8974 HDMI PHY, 28nm DSI PHY and apq8964 SATA PHY now can use
common helpers for the UNI PLL.

This also causes some design changes. Currently on MSM8996 the HDMI PLL
implements clock's set_rate(), while other HDMI PHY drivers used the
ad-hoc PHY API for setting the PLL rate (this includes in-tree MSM8960
driver and posted, but not merged, MSM8974 driver). This might result in
the PLL being set to one rate, while the rest of the PHY being tuned to
work at another rate. Adopt the latter idea and always use
phy_configure() to tune the PHY and set the PLL rate.

Merge strategy: Merge the first patch (either through drm/msm or through
the PHY tree), merge the rest of the patches in the next cycle.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v7:
- Fixed the build issue between msm8974 patches.
- Dropped even more writel / readl wrappers (now from QMP PHYs)
- Link to v6: https://lore.kernel.org/r/20260319-fd-hdmi-phy-v6-0-cefc08a55470@oss.qualcomm.com

Changes in v6:
- Changed MSM8974 HDMI PHY driver to use FIELD_PREP / FIELD_GET (Konrad)
- Fixed rate recalculation for MSM8974 HDMI PHY (Konrad)
- Dropped register read/write wrappers
- Link to v5: https://lore.kernel.org/r/20260314-fd-hdmi-phy-v5-0-58122ae96d3b@oss.qualcomm.com

Changes in v5:
- Kept only a single place which handles extp clk (after PHY power on,
  before PHY power off) (Neil)
- Inlined pm_runtime calls in the HDMI TX driver, replaced
  pm_runtime_resume_and_get() with pm_runtime_get_sync(), since
  atomic_pre_enable() can not fail.
- Renamed registers defines to drop the REG_ prefix.
- Link to v4: https://lore.kernel.org/r/20250520-fd-hdmi-phy-v4-0-fcbaa652ad75@oss.qualcomm.com

Changes in v3-v4:
- Rebased on top of linux-next, solving conflicts
- Squashed add-and-remove patches into a single git mv patch
- Dropped HDMI PHY header patch (merged upstream)

Changes in v2:
- Changed msm8960 / apq8064 to calculate register data instead of using
  fixed tables. This extends the list of supported modes.
  (Implementation is based on mdss-hdmi-pll-28lpm.c from msm-4.14).

- Fixed the reprogramming of PLL rate on apq8064.

- Merged all non-QMP HDMI PHY drivers into a common PHY_QCOM_HDMI
  driver (suggested by Rob Clark)

---
Dmitry Baryshkov (4):
      drm/msm/hdmi: switch to generic PHY subsystem
      phy: qcom: apq8064-sata: extract UNI PLL register defines
      phy: qcom-uniphy: add more registers from display PHYs
      phy: qualcomm: add MSM8974 HDMI PHY support

 drivers/gpu/drm/msm/Makefile                     |   7 -
 drivers/gpu/drm/msm/hdmi/hdmi.c                  |  58 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h                  |  80 +--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c           |  80 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c              | 225 -------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c         |  51 --
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c         | 761 ----------------------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c         | 765 -----------------------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c         | 141 -----
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c         |  44 --
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c         | 460 --------------
 drivers/gpu/drm/msm/registers/display/hdmi.xml   | 537 ----------------
 drivers/phy/qualcomm/Kconfig                     |  24 +
 drivers/phy/qualcomm/Makefile                    |  14 +
 drivers/phy/qualcomm/phy-qcom-apq8064-sata.c     |  23 +-
 drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c       | 352 +++++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c       | 462 ++++++++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-45nm.c        | 186 ++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c      | 212 +++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h      |  59 ++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c    | 185 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c | 440 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8998.c | 489 +++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h         |  49 ++
 drivers/phy/qualcomm/phy-qcom-uniphy.h           |  74 +++
 25 files changed, 2590 insertions(+), 3188 deletions(-)
---
base-commit: 95bcfacccdad8a76e02a8eaa92baaf09c879877e
change-id: 20240109-fd-hdmi-phy-44b8319fbcc7

Best regards,
--  
With best wishes
Dmitry


