Return-Path: <linux-arm-msm+bounces-74649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B8614B9B850
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 20:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E940D4E2FAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 18:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D429B31B113;
	Wed, 24 Sep 2025 18:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LMAa7bno"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AD631AF28
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758739088; cv=none; b=NyhRzPX0EaeGo14DLKNymzANO7NaT+u1Llxsd/6Y/o6u70xIdlUv9MwzQjE2dzTTifmBZaYbWzrNLYxt59wNH+ac80TPGah70gKeIByG7Rr+fqtpeqtsOwAtM3Sg7kNNB29oap4FYhapiK/ktnmPb/T99sDpWf2SKhTA+8BQ6d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758739088; c=relaxed/simple;
	bh=mBFH8HBfqW22uJUINYJENu8VktqxDzTFaEQMWWeNb7E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sJgV6KQUDs5G5P0D5nJ914XShCLB3JiAfsBfK8UzJLXttfM1gAx1YQ2XwZ90NRB92Jj03xc9mg9CR/ikjwR72J9xPn4FEc/8+ZvvuJprUG9Y8nlaEnHCkq7tlNroWAibeyn+6XPCrzvAx4uO3kx2Y7qzelAcb7of6oXMxPQmEYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LMAa7bno; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODCRix023441
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/NakND+TfYX
	aLShyyTMVoDpCY/wzwExv9wBqupV4OwQ=; b=LMAa7bnoQg1w/P1Pw18MSBMN9mc
	AJhL3AsN58DCGER4VlDoLObg0fXayRL1kLzcvWIcHolmEJs/edR2iYgjhK92Jjih
	CDVUlal4/RVxEjofTUSVP3PFuuMFmo+IQ6OdrxaHdyYbVf7eX3XgulT5vKPNKFN7
	vIGjU1s7Od6XlcJje0Zn53cZ5SLur7JaGKehdIXgjagToa9a14YBGrw3b6pGTzLN
	tPKJRVr7Z3bplh6yvt0fVfL9A5rP82xuVn30LZjuYy9CBKBR09SwwaHccyjsQOyF
	nIJ89AjrpTVpnYlebkVVxXCayQ8sU5N6nQW3dDx8OtchErxXB2L5IScXpiw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budacyvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:38:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b54d0ffd16eso67300a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 11:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758739085; x=1759343885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NakND+TfYXaLShyyTMVoDpCY/wzwExv9wBqupV4OwQ=;
        b=Ux5qjmEig+c5FEJqWy+iKmWe3pGPcqglOKftok25Xu3VHb0EvJvvUO4CNNzKUhJBxg
         gZhrGIuxB2yRjCOWiJcjMsvZT2bYJR4r9LW3bScXYiT97w5BzVMBvKQnC8CiM/jV4hLB
         IVWQDtYL2T8BMcngP6DASO9psavQDrgUkZNUA6hc2K1Vej5r6EpfdQqmUnY+virtMR4b
         xT5kUwJI3nWOHV7RQoserqUJhADStM9MzJo2Q3i7MtJiUbpm/g7lYk3w25GHZASDxajH
         V2kcFf+sfs/X88OUMyB9c4vJpOSIcESSgZSjamQX+lcupilHTnLmF/i3y9K3ACA5dh0/
         Ea7w==
X-Forwarded-Encrypted: i=1; AJvYcCUp+huwZIVKfl5MRK6R+ZCZDbFWtgc/uYFD07nXygODpTASXkuxKMcxPk28URnnnTV/HetKEF8waRKxc9HZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa718WA0IEoyXeHVC1uv6/rU6/qZdsSajaQLBryautnQVAsnWx
	wVqaYu7pQMWx4JKFI+B+x+DKiIXTtx8wuTDVVdM99Etwmf9/m4Srttq8xtNtdKwv926iYVAGJyE
	zi/74IqNUZS99a0OJi8AdCQ6xdzIi7gwh1jpqcucv4uEehE527DAdL1XcsbPAKIHgCj5u
X-Gm-Gg: ASbGncvQRdXB6fJhVJaDFaT+/YnJwnKKt3hzjd3gu1NcWdnk0nO7uWbjm6WGQI+oLZI
	FSIpzmUMwUQA88QvsZD0Iqo+4aylPz5MHc/nzT4CqB2v9qZc+aval1ejlCZpGRDymE1ccITiYAv
	LTSgm72N6kX+6Om19vOVMXHB7Ocat5Bnv1di4JCKVfoxtUGHWFyE7uV32T5PD4qgeSVTpVpYcxU
	Sc9hMJJiNehuLAvJbTtcFHUIW/vDlbdJhJRrHvIGmaawi2XCZtnSKMxq2vMtTIzd41rW+/vKTg8
	pzX7eTRLWCX7TTdIjiGmkTOHAsyF3LeRrAQR65QoGeUyNr0Islnp8mIXXvJHmfr/g/x6DNOk7ti
	2WSpZYKFp8Gx5cNUS+Laf6Bci4qA9O42Aznrvcj6Ie9BEpPGK0BufS9U=
X-Received: by 2002:a05:6a20:2447:b0:2d9:b2ee:785e with SMTP id adf61e73a8af0-2e7da45fdb7mr675814637.53.1758739084983;
        Wed, 24 Sep 2025 11:38:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFu6mDes8yvj7I+bjPl9snWfmZNJZ0/XQrsak+gbcpzmtWRDO1fd+YneD8ujyEQDYBhSr3haA==
X-Received: by 2002:a05:6a20:2447:b0:2d9:b2ee:785e with SMTP id adf61e73a8af0-2e7da45fdb7mr675786637.53.1758739084602;
        Wed, 24 Sep 2025 11:38:04 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b555adca754sm6523412a12.16.2025.09.24.11.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 11:38:04 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org, andersson@kernel.org,
        mathieu.poirier@linaro.org, konradybcio@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH 3/5] dt-bindings: soc: qcom,aoss-qmp: Document the Glymur AOSS side channel
Date: Thu, 25 Sep 2025 00:07:24 +0530
Message-Id: <20250924183726.509202-4-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924183726.509202-1-sibi.sankar@oss.qualcomm.com>
References: <20250924183726.509202-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vqEp-yRj-RmFuGljmJsJ_aNPbXxs-Vdx
X-Proofpoint-ORIG-GUID: vqEp-yRj-RmFuGljmJsJ_aNPbXxs-Vdx
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d43a8e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=44w1v6iwfB5DCniY308A:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX2BklJqpW/Yp+
 C0NJRJjEuBzL5w0naj6lAp+EhEMzD3boF6lRK5QrNLl2ITED0sOD7p+RGxTpbSpsazadeUSXesW
 RvSOQwOFRHZWeIXCrXliSzhGQE0cf3O1cuI5IhPs8/zFX1PBVjbRw9ykxNUHB6d9DxEMQSRmGFf
 ds37pfFP8b9GYCJ5CmxfyquMRvKS0CxkyoI1OmYIRmytbavBtnpTO6mxh2jTLV5K8CNdiB4lrEz
 HWjPZTA2MvYpIoqdg8482Yipszz6+IZfvbF1lj9sh9DGuCpmq83Ne1DJP+wt8v70vARhk7iEoU9
 Zu8CgJ3LXfMP8y5p2i/3C5/LKr/W5MTDWGcBhPjMImp9+n1Wer3ohECZbeD2iLh7DApcSe0MyRj
 vhb3M1tj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

Document the Always-on Subsystem side channel on the Glymur SoC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 851a1260f8dc..bee107bf7e81 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -25,6 +25,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,glymur-aoss-qmp
           - qcom,milos-aoss-qmp
           - qcom,qcs615-aoss-qmp
           - qcom,qcs8300-aoss-qmp
-- 
2.34.1


