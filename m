Return-Path: <linux-arm-msm+bounces-101864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCY/MGdz0mkVYAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 16:36:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC8B39EB45
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 16:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 926A73026C08
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 14:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8F71DF254;
	Sun,  5 Apr 2026 14:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FjS2rqiM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R11mMnpI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31362FB084
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Apr 2026 14:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775399661; cv=none; b=NQIEjZBor4H+ORk7xC8xcH1+CdteoPsyfkXQqGMBt9HsgarU8YwlHiCLUmA4p/ippYd3z+4fUP1Qi2lRLbifCy4uL785x/zLBf8yH0FqxUCsnlAMnl2D0LQ8e3Zk2KbV3LSyjJI5sqIzlx21hg+7uYnueGJNOegG+OFP+J7eRgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775399661; c=relaxed/simple;
	bh=v/As2lgvj4nEccaPMNbc8+T6AhYK6KjF+ymCj5u1t5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Whh2afQCHgywpcsw4faVXh5AuLIhljC632dchpgD5Opn+IXXSbECF0qIUVF/tzxo3nCnNCjRKJ9P+f5wRgFahWVinSyx4ZvXlX/+ZsKOlCVh3FNJoz9wzDnAFrqsFBcXFao8cDbVB2586KATGddH4keNV4x5i5nBeB7gRFEiK60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FjS2rqiM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R11mMnpI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635ASuws2360445
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Apr 2026 14:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pq0b4D6oDOEBLPSMi+uQ9Ri2dEKyibd7slMRg39VPNI=; b=FjS2rqiMBWsCUGJF
	+Ra/QhRB/mqTnHoiXaIT3c/G0RuITFisnBQOqGKgMSo0PNedMtZP8HJRXlMNlgo+
	v2B/XxrjECUgPjQZWy1Mfn+4wBV+GxsSxcjgngmyfmFNOORzocaMu1qkhI81yjNB
	ynmT75TqyPIScE1e5iW4DdCJOwoTb/XrGCS8ID78BnSe4mQdQUuezHXEHdHmvEqz
	b+cfk/wJHOx9Wfwso4ErZ/cpGK38689lFHkfmZoQrjCKp72YFjhuRm+GzoYbSHcv
	VqJ2hnnxQtNgT9GOMLmRymsU2/mvF0PlvwnTZQg35ymGF6ikw6/Lf9wxmG+HX1lS
	MskhQA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dau14tk6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 14:34:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093a985e21so93241841cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 07:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775399658; x=1776004458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pq0b4D6oDOEBLPSMi+uQ9Ri2dEKyibd7slMRg39VPNI=;
        b=R11mMnpIDTLKh1WF5s1wpJBSIZ1xDM4xfQub9syq3zyAgdhFEQoYDztMd93N44TomS
         VNS59yYJmK5tr4zSNUXfRoHs5lkpV2BDPl27htoEEQiDQ0nSC5HAndIfMi3g034YniYq
         9QikWCDGK+Pr6XJU9E3JkX23lKJhw/jwIKUmyR6iPskprFFJdTsY/9Ifcso9FRvN1kww
         VkLqrn2jtkxEJZTJZoqyCT0r1spYZRAcf4VIMrRZn+xJ9Y9Y4pTlWcMWIaY248fzRRb2
         wtxeuMiBYVvaCXlqBtVK8cfg806T7bmsJJx/X4JqwCwnxiOKkeE8p9jVNLcARIqRAv7L
         pfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775399658; x=1776004458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pq0b4D6oDOEBLPSMi+uQ9Ri2dEKyibd7slMRg39VPNI=;
        b=dNaItM8rfcYJPQ2ipnj8vB6aHicHhD8YBWuIAbjGfW8HQol5VG749AKWVN+1BKJ1od
         ntWE4VDsDbJiqdbdOdu8i5MwUH0QCDD3cG1Fhhcfh31JV3L8Tc+/n19m9qChnxnx4SeE
         b2B5Ptu5dW9RFrwJ4TtjWrr2kmgcqJHGw/K3OQ4WFWifGgVdZfD2hNHWAu3NlPuEbbhy
         3Y3al28ZzBJaCSXiNp4UzNdgoPrNxkdXwa9VYNvZZmrBDWgEcvCXncKusJkgnIuYhrFu
         jLjibPtFdSSNdZyqYOzTqnJ3gYmwj4nVTOxMvHu0Qtfd7WsIfI1NKC7ee/dCXgNz81kx
         0GnQ==
X-Gm-Message-State: AOJu0YzwD2DyIetOvV3oGuP5dvtVlXTOxtCwEtDoQjCJIxBg1lkOjsx2
	Uo56VQ0T2eIjFN6gnqS5N9q7UJM3gQxQoxrTpQSkLwiLN5cAifDDWN8HmYDMoZb/+EmwRgR4tiK
	awkmL6nt/P6c1696zT1olGrr9V+W4Tg6t59rbhLiJegflNPoq7oALKF2LBDKTqkMi6Y1R
X-Gm-Gg: AeBDietgWYpIh6gJRur2rmux4F5or2FrQtVq/Y3K9liI71uN8QPrWyR9MICf/opsjco
	w6Tn2/xSVeN5f3agXwV0URK5IdGgDr80LmKaz0l9FGWZ/d1GE7moTfIedTab+O8f2tXuHtGJLkY
	zeEjV6dsH95JjjmTab7TZ4hC9RVpi8tLHFsk0jh6AsfmcehPn88NdbO3f+ieQ9lsEK9eye9C679
	PAOtfh355mh2VdcLQnwoEed1rslQ4DOngUUSxO4SK4X0P1R4aliBru9qPC0yqDTI0KmeLk4tyLv
	zzQLEnsuPje5qjLUAETd7mDExPj8aOYJkZlM6JMPmbvuo7855QxZua4RJLH/2KP/G6oCBkyHkF1
	wcJ1YmnKwhvAgFuKY/Wh33FmTeCmpVysGiNPdTUNG8AI9
X-Received: by 2002:a05:622a:1249:b0:50d:8d63:3899 with SMTP id d75a77b69052e-50d8d633997mr23573911cf.14.1775399658300;
        Sun, 05 Apr 2026 07:34:18 -0700 (PDT)
X-Received: by 2002:a05:622a:1249:b0:50d:8d63:3899 with SMTP id d75a77b69052e-50d8d633997mr23573511cf.14.1775399657779;
        Sun, 05 Apr 2026 07:34:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm713934755e9.2.2026.04.05.07.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:34:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 16:34:00 +0200
Subject: [PATCH v2 4/8] dt-bindings: display/msm: sm8750-mdss: Correct DPU
 and DP ranges in example
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-dts-qcom-display-regs-v2-4-34f4024c65dc@oss.qualcomm.com>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
In-Reply-To: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2003;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=v/As2lgvj4nEccaPMNbc8+T6AhYK6KjF+ymCj5u1t5c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0nLaE59TNemyZueMtXcpDVJZPk4CYrSmvb0D0
 vSqzVK9qMGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJy2gAKCRDBN2bmhouD
 147GEACP+6i1YTGenGOtQGzfwjBkXETv/BUdW0/x/4jVBv1zNF37wBK7y3UxrXSF3P3B+oOxZ8t
 WpTyJEmTs9hOZ+GR8SRT3qChNN/UxFqX2qwmGetqvOXLker51fWoqecCCKkLxi7kkuBIhtFN+ch
 pIsiQDt5MwFOopTbZ3aUSTe4QnDoNyJcYvTx8RlytLwLeLK95m0FjxfUCZMJdBBrgq7+kebpNYG
 TF9zc4xikzuZ7lrIz680IsE032iEoQC8/F42jmO/bGlzYEFBaBn4Q5WicwyrtlztfHIxi37aNW5
 SFDUQWCXGvrg/mL337Cvazv6sLAlO0NIOEuE5ZzsSHPCWtINPlmUsNYHkReBzaVjX//T7OLTx2X
 j7eDIzCjuh0XATCuMMkM57sN+jEvYF8aKrrh0iO57Vk3nD7Uy/vnxSXhAn7TGnE6G+pGU6+9ZQK
 MlPJ8Dy+N7pKfcAQE9dhv8CISQ8dWvQM9JXn7ahW8GCyq7I55SB/lnw3v+ah4yeb2zWbqz2Hdlm
 h1+hjjKks0gs0BaZ3YWYQ6O+8PSx/vWQgKuzLi7v4svuRCV12f23AiIc2X3xTy4jZW5LKxIXolw
 ro0oa7eb67Zs5y8UZbKZUTELtZVQS+BC9TDQPlbrNzk01k7QOk3uadm8Ml2TE5AD02EscPoIZMi
 LYizeouJKzV7Yxw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE1MSBTYWx0ZWRfXwqofSypuJSlN
 1DlCUEBIyXrarhAQgVlaRXVudszeNP+sFnTP/2CLAVlAIGls/SqLPMKPNPLykUXoDEjx25s+1+K
 pzABTSMyfWWbmW6D2I0gaBRnyGsPC0j/9SDVs5IvSUHWAkuYlqFPHvcxoK4SuamzkmKor4KxCRr
 CndxcJfMiddV8o2vDDFElOzfRMiXnoX4H6kiuJXrejRlyMeg5zWx5tu0QeDA/2P2On+9Y+Nm++c
 cZJL7Ok8WKnsU60LAaliJu8UEMnveANMY2xVo5FUgC4IQgUNXaRX/70WAnDtJ2rgHLDDmOpCoiV
 6buu8EcIpM2cX30Mi3U5yXei2KO/ivIWRJgXB/hT5bQG4V8+KMIoo4qNpHyhTFTmhhPF0LZsibm
 sZg0m/IMh7OP66pkZ7R6XfVD6Z+KI/bZzk65yDXA/OBof+hoxf3psPZRZbkjjR7bZLWcCw6k/L3
 M2bGiFEmtwtS7/OEX7g==
X-Proofpoint-ORIG-GUID: CWPd8kaoccPg99wcc087Bf6SxfnTTlWD
X-Proofpoint-GUID: CWPd8kaoccPg99wcc087Bf6SxfnTTlWD
X-Authority-Analysis: v=2.4 cv=Q9HfIo2a c=1 sm=1 tr=0 ts=69d272ea cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RlbI4P1zFy3kOpNnRyEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604050151
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101864-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,af54000:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1CC8B39EB45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VBIF register range is 0x3000 long. DisplayPort block has few too short
ranges and misses four more address spaces.

No practical impact, except when existing code is being re-used in new
contributions.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/display/msm/qcom,sm8750-mdss.yaml           | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
index a38c2261ef1a..46dc0d28da29 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
@@ -117,7 +117,7 @@ examples:
             display-controller@ae01000 {
                 compatible = "qcom,sm8750-dpu";
                 reg = <0x0ae01000 0x93000>,
-                      <0x0aeb0000 0x2008>;
+                      <0x0aeb0000 0x3000>;
                 reg-names = "mdp",
                             "vbif";
 
@@ -389,11 +389,15 @@ examples:
 
             displayport-controller@af54000 {
                 compatible = "qcom,sm8750-dp", "qcom,sm8650-dp";
-                reg = <0xaf54000 0x104>,
-                      <0xaf54200 0xc0>,
-                      <0xaf55000 0x770>,
-                      <0xaf56000 0x9c>,
-                      <0xaf57000 0x9c>;
+                reg = <0x0af54000 0x200>,
+                      <0x0af54200 0x200>,
+                      <0x0af55000 0xc00>,
+                      <0x0af56000 0x400>,
+                      <0x0af57000 0x400>,
+                      <0x0af58000 0x400>,
+                      <0x0af59000 0x400>,
+                      <0x0af5a000 0x600>,
+                      <0x0af5b000 0x600>;
 
                 interrupts-extended = <&mdss 12>;
 

-- 
2.51.0


