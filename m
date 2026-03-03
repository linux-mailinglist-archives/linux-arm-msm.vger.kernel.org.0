Return-Path: <linux-arm-msm+bounces-95092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMSKLZWxpmn9SgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:01:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE3F1EC3F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ADE6D301BD6E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 10:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E6F383C6A;
	Tue,  3 Mar 2026 10:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fjG2bt7/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y+nFNjfq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CAC32D0DE
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 10:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772532112; cv=none; b=JnU+dW0m7Ew+c4IyDFcuzvWjj6ASiX+ZhjvITeaAaSWLRAg3gWR7J4dqMyP83+WimsnxDCgvcuVhGHRwHtEVqUZ3kWQQP/qXVRYsUDqW1SXCgibMy/Oe+TatXbX0EmttO9pFZuT3DOJKPU+oVFurRyaGBxViknApO49CrD23LH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772532112; c=relaxed/simple;
	bh=ZFqrnGKk0tnO6TBQUohBuHfE9eyT+0KRooBfFamK1ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hnhAtevqUcYUf+QABeH55kDrGE5Uqx9SF5fPLZ7aj3jrdvyv3+cCudNPdAsXQWrvag0+EKEyETYmSeoz9yxf2ur/sGYvw3OmP20FJBut5brg7JEm8bYJG0XLZjWldyccRpiclVXsxpTf2oWasdzok/xU4TYvas3p7kEtN13+NWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fjG2bt7/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y+nFNjfq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239n5BM1838172
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 10:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dv6VNShe8vuehPuHtL4Udtm22Se94y1co3llD4z7Kj0=; b=fjG2bt7/RQe8xcBh
	ILEyB0p2hKz2SyRcE2ZhhRF3KgFJd65MWvsKPTV6EhTIMoOU81JYyPTNVzoLFiQ2
	ZmTXshfCDFx66Z9IW2PSu5Zzdcd2v4vSOPNJ5De1R/Bo7JJTyIJOMAeLFocn1rM1
	ahFLDmZIrk7Y3ELk2hDCvgcUprsfaOGYSeBOrnTnXPdmGxwtflhJjSWJkK2bKyO5
	24T5arpcD4i7Vqv+7VqWMhjpQ76r0OisVHVzByeJg3d/ojN1aTEN5FO6SBFy+Vss
	QspNHNuaLuMRw31MJAAMk/GKOjiRRuoATPGrzF/mZkwvMDxx3MSQN1/vfrrdwO1c
	nYkJLQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnngg9qxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 10:01:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70c91c8b0so486487185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 02:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772532110; x=1773136910; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dv6VNShe8vuehPuHtL4Udtm22Se94y1co3llD4z7Kj0=;
        b=Y+nFNjfqYjh3zEFtA41me1bIEplLxmwr1sfK14McmjzBTxdXupWW4jbzg3I4xvtVCr
         WNli0DWYx4vIzDiiTuRSpBY+ayOd2hmfN+V1S1Q51H3Dcn1HfX+rtDRqEpONKe2iEHyQ
         EbPjbzWT9IQtfjqA39FHIsGN19nLvvV9DpsBlTqKlXLQG3JoBH+9pQ9jJA26Rz4MzvWa
         1/jnTiihN7ch6WY+tgtPyzx24Pp5JBsItMCVxe6YXVOR0dLPGArAJ7gEliBqC8o8XG4f
         oFKawIgYrq9NSO0npu5mYh5Sc1w0U3l9d5kpez9t7KLqrpXd4CZj2bK2LlKhlPAv1Qfg
         OQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772532110; x=1773136910;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dv6VNShe8vuehPuHtL4Udtm22Se94y1co3llD4z7Kj0=;
        b=MCwXhqzWZXHIdLp9t7CquEgdyGS0VU9gcJR0r3ojKlA89db/VMYlUUmnTafsZvTyM2
         IO58Nv+HWtWEivLwfY6TWp4NzCwTSkVsX8AmdyJRaTePPjeE3YNialQgk67EnF1EfIKk
         B3b0ua67mzYNVAXzb5lZ/FY/zElj1yl9Nd0XYoi9W+aVHooU+rx1x2ycJWYg4stzGOkT
         6qjtuuC7ayUKy29yrN7cdgGTNKOpxjYsSBsaGgl4bDDJGwgpnz3eOqmDVdOvZJcoSMGK
         j6ov9bovWnA9RHQANbyb3gvHBbejNuJ5CvxaITmr7Q756RXnAqCpXFTZwF8XpAmCQWX+
         NDlg==
X-Gm-Message-State: AOJu0YxM+fsBVd6IR+GFu56Yu2yKsZAlqvaObkxgXfsBYq8H7ZBHaG+O
	NuovWT+ycMsGVlvF/Y3CGQATm+fguQ5uk73bByqYVSKojg+mMj5zLPoMQ6N0MxPNYIHtVBtFDnW
	gmWAWq4h4ENnA6pfKRvTh5VPiYu5FhAPTujN22ganjTeyciD+PGqp4dIwiYazrvy0oq4y
X-Gm-Gg: ATEYQzydvztYRmxIp/c7t7WPiHOTa8q0RyIGdistrZovyqUoHngGGvgAISv5k3Ri0Xz
	qJZQBL2NSghXuqEVHaKLmUw8+k1BBLth6y9575eaal53LCHaHrW99IZ/j3psUQZAnHFGCiH3fiB
	kGtX/+xxT65WwVydFoIixJW2c0LxWaEgyFZpUrG8SSFbUv9dov3WdzVkWrOrS4wz/vd3vf8llOs
	SUUpjIa2yaKEtRbGEc+DVxzq2QbaeNBXzanlKsFcL7541jD4FPBAM4Opds5j10S0T5DABLxwzev
	0TioIfjS37L0I2D7iNoQAjkdF1PXQJMFKS6tcnZ+XeFCHWaR/QzczLO+LvkfkAHVSB7ysVOwfQ/
	9JbMMRCsYwn8j+LfmAM5P+61f2GtcNGIiRCcSg5NaOuASSjC62ozgkFhzzAX7YcXU6rxwBhW7YP
	sDaLI=
X-Received: by 2002:a05:620a:4004:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8cbc8e7a050mr1597177285a.3.1772532109743;
        Tue, 03 Mar 2026 02:01:49 -0800 (PST)
X-Received: by 2002:a05:620a:4004:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8cbc8e7a050mr1597173785a.3.1772532109249;
        Tue, 03 Mar 2026 02:01:49 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-660b5df4bf9sm177898a12.29.2026.03.03.02.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:01:48 -0800 (PST)
Message-ID: <a1984b36-6cf4-4fe7-be38-7b401629b235@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 11:01:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: lemans-evk: Rename vbus
 regulator for Primary USB controller
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260303080728.479557-1-swati.agarwal@oss.qualcomm.com>
 <20260303080728.479557-5-swati.agarwal@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260303080728.479557-5-swati.agarwal@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P7E3RyAu c=1 sm=1 tr=0 ts=69a6b18e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=BN3gxCBQ14Jbxuf07qEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: cLqPMpnQqa2qoq3ui_anmKQ8wz4lSk1e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA3NiBTYWx0ZWRfX6RyBGD3O4GjC
 UQMi3qULOFJdDn/5M6ascM1XNcWWgYF+EudVjtH2cRo4tTQlKMgvv9M1S/vp7V2e4rJP/l7pgOZ
 j+vPhSS1e16OFEZIcHpeUCasN4bvMp56dj7A8Lg8/qs47XZcJTRPn8DuqpEmi527VtzmiD7VDox
 ylJExp9V0UiYIVJD37HRlyXMjrEpg33XMunL3BGaIo2sVgzBGOLvysOr9RCZHR2Hnkok1wK5vDz
 rsJv5ckOfee8RR2Dahv3J2SfNVrv7WksjvKPyp0rYMWCmQ6cLA9sHVVsyGrMxvOEViKUYuymZDA
 5XUGgBl2oZm0o3Qb3UcP3/F7x6U/3IpiX0ic7cqFJR4JtQMRiVkM3qXHceLUu/N6hSiEFfuZ/0f
 5zHXIeNZ+fSXRRW2CHzIKEQvnOh+pPqf7s+gPhR/pOT0KBIK2+e6/jNrkBTkbshM+NB9ZXvBqMe
 9Nq5lQtqpfUIpzNpxCw==
X-Proofpoint-ORIG-GUID: cLqPMpnQqa2qoq3ui_anmKQ8wz4lSk1e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030076
X-Rspamd-Queue-Id: BEE3F1EC3F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95092-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/3/26 9:07 AM, Swati Agarwal wrote:
> Rename vbus regulator for Primary USB controller as per Lemans EVK
> schematics and in sync with tertiary USB controller vbus regulator name.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

