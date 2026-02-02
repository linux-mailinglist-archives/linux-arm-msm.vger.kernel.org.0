Return-Path: <linux-arm-msm+bounces-91413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GGBDWZEgGkE5gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 07:29:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCF9C8B2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 07:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3032A30214DB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 06:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2CFD2F7478;
	Mon,  2 Feb 2026 06:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgW82qKm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VAGV2/1g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3B32F618B
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 06:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770013628; cv=none; b=aTEonHw5a9Xc6j81d9OBcX7nsb4gGH2mHeKq1l2/RghHuSwgfw/dpaRpEXVxINfG//nyM0o6NzLxXOJv1WbkGwVr5l6q8nU7wEV9ldGc2+Oup0URHEUnJrFFXbTcCDBUMOgk9Gs38d79nCaYAr+w8FI7kwLzDWhQi7nIGtygul0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770013628; c=relaxed/simple;
	bh=GGQHGgcUkz4cUcz1cuTqDMCzyIO1+sLpwJsoipbt1kU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZafJhBN4SPsp9X/WlO7KhIKCu9vrQdXJgR7DuMngJNbaBoD1MuUDuHdg5F4AqHDYIhHLLlg9rEpSyDJroKC5WbnzVvjH0qIK5cy2cmo0xz+JScmyUtrdeEFBDGZXKFmYJXO/vECxF+/ENrtohzCIeANnopK7ZsvtxfJgA9X6qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgW82qKm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VAGV2/1g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611N0RAX2367015
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 06:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hKd3xBOJcYKdlJUCSNr4cOBREmaInmTWxJQ5ABfknjk=; b=DgW82qKm2GQl7LcC
	clj2LCa2vdLZIFftDZpscBq+f0Su+XgDDZ9ChPRe9oJvK4Rgiq8Xm9hcTrna6JB8
	n2Z0OtTch73vcaS6qCgN99dBajyUBShIigJb7inYRJ0QuE8HdvVnV1PQhIa0ZiFR
	2TxBXvPqEsW2tKF3SNaxCxDLlguy6eSm3gIpaynDL21VRnNT0Y+Kyl/WCy1xIYRR
	E/PRKmXpjeYX0QlRhpzio7QLyCOPgFSzidFcll1ORPj7LB73p6VvZeXPtejPkr2U
	KdJlfUeRHyrr4DKJ0yHcALUXLtn5fTwYdV15Alv1Oiby1xHGS8HDqvrZpC7uAl4N
	KenI9Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1ard46r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 06:27:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81eef665b49so9924683b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 22:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770013625; x=1770618425; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hKd3xBOJcYKdlJUCSNr4cOBREmaInmTWxJQ5ABfknjk=;
        b=VAGV2/1gKdTMfbC2nfrdGDSmeV30IaFwTiObybJWDJM/IdoSHzrDCtHiNCY4hLoFS7
         C1W0pUFb5VmZVNSKPYuPnRwjjYYcPmEZXRJcTU7FXXD9mJJ5TVCda+JLRdMXSkMdVS15
         6xNlLZnMq58i52pvfNpHlA3SRR/ksTUtKotER0KsFb/TpFtLaafZuIPQPaqDcrz3Sow8
         uXez7v58g6ZGXxwzaB1WamMHRbu6nHFySXmjstkmnB3JK4+KVXCSOSoQBupa23BKYTvP
         BEkDnVQGvofIMGwD6yD12/YirSsGEjSy2SV/nPNXBiYcgF3Is68rf9OJdlX2CT8Mkyhq
         Yy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770013625; x=1770618425;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hKd3xBOJcYKdlJUCSNr4cOBREmaInmTWxJQ5ABfknjk=;
        b=YG3YBxi1sFiJD9lfEtfSuwTmObzK2bjUMc0UZGUAPksM7FsUKieNvjJnonbuL9Txeu
         Gky/AwHi4Z5j/hNM0LOuxaVWiU+FI26prdIMJVg8U2fBN6MxF+5HZ0gqqOP/4V/ROO/a
         fhgVXkBmoh0q60dCqErbhSKSnEpD8b6BhZGir7dcYfcGnGAMQw6H8E0/q+6vBmr/lD4u
         UBi7oBi6zxhmzGF88DrCeW+/yOuQDidZLO+I+z/8srt0nJmeTrnFctODFVo8AM/D8MQL
         JlqZuHVrBgjdTpxx4Zuct/hUcpfvBqA89kO3HV2LMA17VtP04lvy6kEBK9yJfBAgB7F4
         A/1w==
X-Forwarded-Encrypted: i=1; AJvYcCVvsHezF+PlVbtHF5oIjywSIF11jHZC5xT/MeospLdeUz7kd6AMGJAC+O/uQK/lTQWGZ5UyedFV8DOMJcJ9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1r3GIz8LpcdUd0eFqnfiL/AK/m3+M02j1myG8M+/S55TFavHR
	PRXXe+d8GEXArgYYWibCyWyB37jStYK7SJfl+9Ft3lFD8WXda1nLwJXQgi+SC9Xt9MWZT5mglsL
	bY5WpFW4dG9sPBGb246+6a2lr7ERJ4kqdPr5r6yoftXDHuUEIlrTu7wRrc6tjVVQK3mU3
X-Gm-Gg: AZuq6aLwKn9bD85dq9ZPU2ghBYGUaKbkzRUbTEFwjIaNEYy16x4Z9Sy5lwdWHNsEr5m
	ln1Jx+YNf50fnJQwqrt6Ix009caoUR4aVHaFDS+nov2WgeMlXILjfLFC5+VkHKXyWq3n66YDZgR
	5jpop3g/Ah+Kz3DweCsCJiOSd4ANPOJlXrNpbsVuG1KwoNTni8Xxa0a5JXeo7VyHsNZ97E3QkbK
	kASMzwzAHkoQRLoH5laAGh4iuehuhO4nJYl8I5OASGe4OajlS9OaiYV9V6MNzZG1t1KXQ6e4LTh
	94bIKBrRKuT+vlX2LiP2LR+lmlBgOhofBA84SpOkudEODK6+nT3ciuTKOWwQEE7v1q/5xT+T1+d
	kn/6OOOglPkkEtu/k1sswzgbUXc7JlfGu2aWfEboCmW4a
X-Received: by 2002:a05:6a00:4b02:b0:81f:4f47:c6d6 with SMTP id d2e1a72fcca58-823ab980923mr9045806b3a.65.1770013625109;
        Sun, 01 Feb 2026 22:27:05 -0800 (PST)
X-Received: by 2002:a05:6a00:4b02:b0:81f:4f47:c6d6 with SMTP id d2e1a72fcca58-823ab980923mr9045785b3a.65.1770013624694;
        Sun, 01 Feb 2026 22:27:04 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a42b3fcsm13855359a12.20.2026.02.01.22.26.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 22:27:04 -0800 (PST)
Message-ID: <d41ba6a3-6f5f-5c4e-600d-70fac7666ac3@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:56:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/5] media: dt-bindings: qcom,sc7280-venus: drop
 non-PAS support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
 <20260131-venus-iris-flip-switch-v4-2-e10b886771e1@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260131-venus-iris-flip-switch-v4-2-e10b886771e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA1NCBTYWx0ZWRfX0ohdjjMqRpCG
 cambHgYk4BylpcjES3zZSg75EI/BgvYHLfzJPnazLeDY3OB9iHIdn0pu7sy53raKTgZZq9FZqUS
 Xf/l/kv0N2Mfj7+TcMfMoiSfAmTzNlCCyf0Rt69UDF9wlRDhalii2JM6E0T5yxJQlzti1w0+t8N
 XU6wPLpxjWXc2cGVcr3nm8Q2d600EjMvqm09ODJHl2GJdeyDJlM/QY5nRjJGJiLu0H+K+Wpt1+M
 4+9LhLlusqSUJYdqMUafnCudY+ceydlEc6wU6ufwcDZ+aBl+kHFqg2sXD6jOQSPJQms1bf0Ri/V
 ZA9ImwvUg3jYrpzmThlLvQ+F1a+adXoStu3YWMVqM2Bk45XOARQeEbVikDl0A0RqSF/c9x+FB2n
 uXB2jbVu2G5sh5KMfd3CwDHQZ8gnfGOmF36WJ1mVHqY/8FcGPSAWtGWkFzU7v51znL2dsg94xo8
 nCQIpMPRW2ylcH7dh7w==
X-Authority-Analysis: v=2.4 cv=J6anLQnS c=1 sm=1 tr=0 ts=698043ba cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=77rIbJGYNedRJNbebaQA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: -PJyAbsVnaye1DgvCZZDAxspH_HOlPA9
X-Proofpoint-GUID: -PJyAbsVnaye1DgvCZZDAxspH_HOlPA9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91413-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9FCF9C8B2C
X-Rspamd-Action: no action



On 1/31/2026 7:28 PM, Dmitry Baryshkov wrote:
> The only users of the non-PAS setup on SC7280 platform are the ChromeOS
> devices, which were cancelled before reaching end users. Iris, the
> alternative driver for the same hardware, does not support non-PAS
> setup. It is expected that in future both Venus and Iris devices will
> use different ABI for non-PAS (EL2) setup.
> 
> In order to declare only the future-proof hardware description drop
> support for non-PAS setup from the SC7280 Venus schema (breaking almost
> non-existing SC7280 ChromeOS devices).
> 
> The dropped iommus entry reflects the extra stream, which should not be
> treated in the same way as the main one (which doesn't match the usage
> described by the iommus definition).
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita


