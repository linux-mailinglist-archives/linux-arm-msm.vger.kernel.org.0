Return-Path: <linux-arm-msm+bounces-103253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNXVNPlW32n1RwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:14:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A094026F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DC5BC3043976
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6563254A3;
	Wed, 15 Apr 2026 09:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uu+4hoAL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H82mlKNl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C712BEC34
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244379; cv=none; b=XqY/EqqLXqKgyaL9WhR4Mtl3fXwVeJmQEicvdUemHEnBtJ44wsPyDee9MLUMMOF5T6/RuNNIyMmjGL4M2QxUTZwTiXvXsJT6w9ZyDUO6AVhX9cjlqTeFZN87v7ghGVcuwN60QTlzwQwyMxrwZG14iV83zZ0gmccqxvvkiTkrfLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244379; c=relaxed/simple;
	bh=sGTdXpxNCKuRfE07ndNB12uvcKLdyMxK5M9wbhEkJcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QLdrVSIbarc9Wo2eL0m/G7XW5iugyKCeND4gDLVnN+35JP72fRQSQQSEOIQaPRLm5vbHMSfw9a2IpqFCRIjcuBc5DG5Tlcj1AiYijmIcJtGQd4hRwUCv7y/6xw6czxaZDM4ObHtj1KrM3es8Y0qfI7DGMP6fFzad0+MEg10YNKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uu+4hoAL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H82mlKNl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F375Lf1778836
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hmB34MFBSuyjUwzKZQavgV0G4aSRkdm5OzKkkYdbP3g=; b=Uu+4hoALSjwbB2D+
	U9/yBY7CX1wvCPJFcv+3mTcGE0aFs9DlzvRjWc/wR1oxMYbXNhWaijZ2DhCDcUKB
	4ph0rvI7T/eL5dxuVABNCNGLNnB2qvKIgFXbtza2kmzE62F8oXFXNeNjMLivMsR8
	HXFgnpOSJ4rDSj3Kb41Yfp2gYAZukguFrwMGnLMmU3dBBBBK8GMui3Z+o20jOj7P
	31T4sC2FIJ5OfnEb2bFmm87d+dl8YpiNy2aZAw/ujrQn/nCuDi9f8zWw1F4PyQso
	6Y04NHbiMyvtsGzPOBzgceI7mKsj+j5Xt4/3xjPBpup/TjN1p6Gw4f8LS6mVMWa5
	9zuoag==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrw02x7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:12:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d45ebdbc9fso140346785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 02:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776244376; x=1776849176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hmB34MFBSuyjUwzKZQavgV0G4aSRkdm5OzKkkYdbP3g=;
        b=H82mlKNlMaBNKgwQNudicu3Iv54HYqBoM0W/5cnKbb4Ja4TyCmhLo5gH3SSWcMZW0D
         bGISazK6jomVz+HjDf23OjJtOKXebrEE03HLqtqNrsFVA//fOthUokThjDIi1JwlTCp5
         +10N69T1PFVt2fPhrPaLvbDTDw/hXxTdzQrYvxzd9eQ6NiVu/L1to8KFQHWS4D7R3c+L
         IonvgOaYPlAr+WrD9hZdMBBnOmosDB5YbBpUaisPiaZ6Y3vo1gzQIl4ooxpVIP2XSN60
         eFjW4mL/foG5zqgn6r+wdGSazQfn3dF6pDbb/jbFCFdgVOozfflLJ8nHDNFpXJXU0KxV
         bywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776244376; x=1776849176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmB34MFBSuyjUwzKZQavgV0G4aSRkdm5OzKkkYdbP3g=;
        b=GWkjMDKLNrY0/amKr5jC71iFisarloFUXP/mkID1tcytRuPzJfzQXA2aVOtitgHbH3
         JmbzoH9pDzseAbnbZFaZcQ5EE15KMDZSQbKFW3OmvI6PgwyjARGGRrJZBiG/+XUrcsqD
         v2ins8vL6ej68MoIbdeo3cOoGvIXTKuTW7y9iUWAQb0OKw0Tl5GohT9ji79WO9JdgksG
         ZyZpJeDaBf7aT8W9UJWnE8eY/Cs4Z0gLW5WqOfesUZCfL6XAAvdVFIdKghrIfSHlhgPS
         U5CC54NJJUF4MlfdZxx24qI9UBn8j+Kx7SsiVO94ZmdG/3BFuqrBz8RKptP7bpkDxikL
         E/aA==
X-Gm-Message-State: AOJu0YwR6++u87F/n5BC/6jS/JUMbVLhvJ9pHFI0PQKo+uzp50pIQFNI
	9LJOrFhqJthgKVkMP2YoKwGQb8SkBzZauqJhNsjVViU6dp5xtRONGmojAIKkyrdwm+3YFBjTnUZ
	TQiGqFwIrGYl7A6huqXmzE8xYmZWhBRvi1abd5Wbyll6pkqKCEeUSq8t8iGhaUhP4JpYv
X-Gm-Gg: AeBDiestthF5CZxfY2jkgPnLQ3i3XpeSDkF9stbvFbS4JBjZnhAQu7edfgZN6ckoSzP
	apRsiwZqyzFv4QSEa6inikTG76jd2zYKDC53gWRi9S4sbpZE89iKj0w6tXQ/Zr9gDNohgijq2jH
	WM/MAeTmv6IeR+623wjghkYaa1RTaywUqU6g5r7/gCzM8sdhw+wOPBeAlrnpTVvsp/tJKse8oMk
	Q85/CQy1XBrmmDkL4CnJTNentTYL00UqLdo36JmgtjlPUmMU6Y/Yx0XTStiHnJTQabyaqlGV0a5
	0pnNcAXEyM3KnHRlGdevh5lvNCWa2c+Pi0R30MaroZjSHYU6GTuHdxzjZHPAZU6F+m9zjHGRRuU
	f2+AO0dnuN6515GzRlMdBwm8OcnXvgeLJJQMXemVwqpcaRH14YXFjADNLGsJ2nklG1ApWdRH+Yi
	jIJJ0DmgXFMPQJKQ==
X-Received: by 2002:a05:620a:4002:b0:8cf:d2be:5796 with SMTP id af79cd13be357-8e4cbfa5536mr170165885a.6.1776244376119;
        Wed, 15 Apr 2026 02:12:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4002:b0:8cf:d2be:5796 with SMTP id af79cd13be357-8e4cbfa5536mr170162085a.6.1776244375530;
        Wed, 15 Apr 2026 02:12:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67237d842f6sm225162a12.9.2026.04.15.02.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:12:54 -0700 (PDT)
Message-ID: <17b2ff60-d2e7-4f88-b2ae-f4dcad44fc33@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:12:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/4] arm64: dts: qcom: Enable GPU & GMU on Glymur CRD
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
 <20260405-glymur-gpu-dt-v1-4-2135eb11c562@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260405-glymur-gpu-dt-v1-4-2135eb11c562@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HpfK75xplMMxLn4jvOXakSx4_iG7Difq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4MyBTYWx0ZWRfX3IpOQFuQzeXh
 yOqfNAIBiFwP6mnHZZBfbpIgpXbnaJpjovl3DRieZ6AIh8ug1DxSQQJwW6m4oLZAsVZXS71GzJP
 CqAyu5qxa+0tEmzcWoeqr8xov6Gk1yePHsB3FujFCc9BKnbQ71mKpbLApskRE5YUH7F1ii+T/cJ
 TKZ5nfAG1XHwMArs2+VQgsd8XA1FYXwJnC59EHnd4EhueIpE8FHG4mY+Pk8oFKS/dVBMrK0+7sd
 NWzL/pptZrxsNBYQ3tn7fQgltECioacmQ2lZYZvlKMiHy/zCga4XtrI9tIG0W9mX4t/BQV8R11Y
 gxojGKRuGZoNdyGGAVyGsfvnqIi5Ovxg6iy1t0s6vYpbxYhkI8BWyq2aysySQjESxj+ul8EO5AO
 wa5smBXFs1p4fLGRlKc7ufARtYjM2jQc13ZfLYwutfYiRzpI08ejch/tPJseARKwWf7oBzwp/h5
 zGhaSiMozxp8NnJO9Pg==
X-Proofpoint-ORIG-GUID: HpfK75xplMMxLn4jvOXakSx4_iG7Difq
X-Authority-Analysis: v=2.4 cv=YMGvDxGx c=1 sm=1 tr=0 ts=69df5699 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Vhnk_s3sKeSiNHHGov4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103253-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 09A094026F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/4/26 11:03 PM, Akhil P Oommen wrote:
> Enable the necessary DT nodes to add support for GPU on the Glymur CRD.
> The Glymur CRD boots Linux at EL2, which means it doesn't require the
> secure GPU firmware (zap fw).
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

This isn't a blocker per se, but since there is no more zap, do you
think we can just enable the GPU and GMU by default (i.e. no status=
"disabled" in SoC DTSI)?

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

