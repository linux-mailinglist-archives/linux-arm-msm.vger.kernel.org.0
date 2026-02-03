Return-Path: <linux-arm-msm+bounces-91614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKkxMDSpgWn0IQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 08:52:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A49E6D5DAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 08:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E382F301A87B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 07:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D381392C2F;
	Tue,  3 Feb 2026 07:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HJQr9k8M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WLMXkWMW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97C531D74C
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 07:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770105138; cv=none; b=PDfx+Ue+Kwjddsc8gpnyYEJ+L999b5aYkL14FHskeYVlfwy2tOexS6Ffl2voAktnkiLobXEqSeyC2kHeHGA9pVpjbkAKlfL+d/ngnHNBBFMEoKM2kQ4qTJNsJAmHBWUQNE3+qItcKUXVL5dDxaUoJ3Xuz9Hzm/ynzZaC0QfBzOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770105138; c=relaxed/simple;
	bh=3EtoTzrW1DsIQaN/sP+sMHlPYBvLQVVaSwu63f5Kj0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AQ89IzBjumAjY1xlT04fwwBK06/QQdIeXZA0SQuKCpcfK39OApKA8S92wiO2GVKNMqcSmMtKLD6u/IUrvm/HVfw6yW0s3WkxNlXlVcvqYHWwSWl7hml1kdoSPfHDkCueuF+vvdXxxXM2I2CmqFqmJO0JYcTJQtp4MviR9sulS58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJQr9k8M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLMXkWMW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6132fHZ43387813
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 07:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mUlDuuMzC9nA4znLWFYd81AovsEM6ryHbDISxdNVVsU=; b=HJQr9k8McwV1lG4O
	IJDEkzIyYz78gEYdQtAyg/ycFG+DiZCGYkHUaGu/Qx3jih1sAN7xgA4B3MSfEqXQ
	XZTHNQpjZaYEZgtDt2+OhW5vuVj5k4cVBny3Cj+5vp4bupcnCBPGkHSMFn5SomYV
	f5IdotSy2h+QxI/CI81B5RO2bZrfSfyttQCoMmiyNkK5G4oEWX0S/1Jb9BIXI0Kv
	5NNqhJEyb/TRLnbyNUsuS7Ki9SvCunzUIxbIOZpALt6W91STtFui3/5QE71UNzvW
	6qHuLj+RWJiZnBf2Gq4lxkuz2LDykzDcYb23A8Mh//nPWDSmhMkx3XkORUSCiXfg
	BHWDkQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2xvbtkyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 07:52:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a7b7f04a11so145215755ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 23:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770105134; x=1770709934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mUlDuuMzC9nA4znLWFYd81AovsEM6ryHbDISxdNVVsU=;
        b=WLMXkWMWlO6dhrqbjrw3t5ojDhly23rS/N+3FhtuLrF4xL20wDp27oV035jGD8khBF
         0KffYQxXDd1LGvQWXCYu2IzmHIdSDKtjD8XgUXA07nELl33uiFrfU0QA8aME4UHQtnNj
         69mriFbYvbZcr68qpq3hOANplhciHKSzQvEmFpg/v/pYUC/VYikici1ScdB3vfiTy0xe
         UuKiYCYB2x2njdeDzXng+yStPcjhMna8hLRLQffT6RDlquJidL0B5a/mPZFRiAkg9wPM
         fzk+N5gNklGNVHN/kT1hGekh0hNp3vPdnVql0Ul7y3MC4nYVZ4XwVWW3v7d/ihxQm1Ie
         RIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770105134; x=1770709934;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mUlDuuMzC9nA4znLWFYd81AovsEM6ryHbDISxdNVVsU=;
        b=PibyFuyIu8t3/1YecN/T5Z9IN/i3ljfawnINIJZLppbqNOKgFM+sIqBYqhZmUORfob
         +zrQtKlH+or6a0lO853aT1iYq3PkMWyT7+x9jVZ+qvMEJtItFWUkwd14hLKStqt9Gogn
         fJvYqF2xdsK5iRJ+m1CAZxr4RmM3ZPwBwmw6F4FjK5ktwyl89GOpEHeUIVAH+F8CchK5
         FsDcj0kCIhevGsvf8mMSwrbgm3S2LyhTvXyIkvIYRfexEdKXFzUsXubZn2UNC6y9ltcJ
         Sc8H/QEERivZvkg5qf8hKGgTLQ6dyPOXE9tQ0kr4doHcUrWzhVl5TdwglR/7fLIzsUGv
         seDA==
X-Gm-Message-State: AOJu0Yyyhc2F5mMh2gAfp6H4iX6IPWOYX/C8a8nmEb0VQ/Oyv0JLliL5
	XD5tIF0oBWy+YmUY9nwWPnZPLx8/fe7uwbk8CmMbEP7nylUQgpfIqODd/ekWeg7iOpBjUi4oUUk
	uCQHrZSTh5CbPF0vXQZ0s82PxstFDx3mfuPxakt/x/qADG+o2YxS/evDpHZwVECEpXv8Z
X-Gm-Gg: AZuq6aIsMz+BF6BQdmFkasTCKbgvCt6aLWyuFPDrb9BsNzXGor/evCuBgUyVZsDUAGc
	bJR8XNgOg+xXxt2Mtgo7xDx/LI0gV09OuMSsd1RV0BC33BmJROnshF8IjC27ywmPnjQJEwfoeYO
	Ah6UzCTcvW7kr0SruDZ2dCLaDbYWog1FFVNUGKaOH1BRyJeHT4kzqgJf09GYDIJbqOdn/SyO6Jh
	p+BlAk1AsqeUqup4BZ4vqsyW207LaSjSEJMLhBX4JHnb/00Nq/puJ/j+gssmBQzvAsH8RSDe6Rz
	Hj5kOB6qnsAoLWDjS3wfAzuiELM32rdWK9dPytEsCPkKEa7hfKHvSU/A+cc0taW1Ab5M9vFe8jY
	EsBhUk3Uxy1v4g3yNTYuGCVH43rTu4ssK8cEGuLzOov9i
X-Received: by 2002:a17:903:234f:b0:297:e59c:63cc with SMTP id d9443c01a7336-2a8d99370fbmr145075585ad.35.1770105132599;
        Mon, 02 Feb 2026 23:52:12 -0800 (PST)
X-Received: by 2002:a17:903:234f:b0:297:e59c:63cc with SMTP id d9443c01a7336-2a8d99370fbmr145075065ad.35.1770105131536;
        Mon, 02 Feb 2026 23:52:11 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b1ee89sm18645334b3a.14.2026.02.02.23.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 23:52:11 -0800 (PST)
Message-ID: <ca5b0a8f-fa0d-b7de-cc2d-0615ba4745b8@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 13:22:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/8] media: dt-bindings: qcom,sm8250-venus: sort out
 power domains
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <20260201-iris-venus-fix-sm8250-v2-3-6f40d2605c89@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-3-6f40d2605c89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4p-pc72yEXh7fGFgKciuGWVf2pfSYoqs
X-Proofpoint-ORIG-GUID: 4p-pc72yEXh7fGFgKciuGWVf2pfSYoqs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA2MSBTYWx0ZWRfX9pl7VRiAZO2y
 7rOppq1XSD1VN+BINlQZRp97XP5KIyTqtdUwqsCOm3EhPtZQ+d4Y6VNe64zUlXYpoYnPts+UQJw
 q9ggcbyn4Hg8SMpp08OBvtryJ+prM/J++roc1WmXb1b1etfv753CLmAuBwcGzlVFEwG4jEQqomc
 +8ZiY/M0BO4Fm+YQYl1z0ssXDt04e77eGQpQkQ6V9i/7km0NYWpcMBGm/4vc8u+kegYt2QBut5F
 P2hbZi0A9OJxhCWlepSx1nyh+5xC6zzjZHfZybN619WH6gyXxkS87VNGnEuXO5TOZJcXY+hF2VA
 t39aMFNEHaJivrEVNIqGlDLYea6YrQwepmhBjOukpiAdA4H04lj9EDwn4D+/4BXu8ZPVnB70wzu
 latp72PaFFS419XVE6CGrw9TtIwHf7mG8S32MM34QEdMcwlqOnGPGpOUJd6e7QdNMo0XJ4Vxzq2
 48PdSdJyqEbM6snRiwg==
X-Authority-Analysis: v=2.4 cv=AurjHe9P c=1 sm=1 tr=0 ts=6981a92e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6p_0Lpb7IDiqYsJo38QA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030061
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91614-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A49E6D5DAA
X-Rspamd-Action: no action



On 2/1/2026 4:19 PM, Dmitry Baryshkov wrote:
> First of all, on SM8250 Iris (ex-Venus) core needs to scale clocks which
> are powered by the MMCX domain. Add MMCX domain to the list of the power
> domain to be used on this platform.
> 
> While we are at it, drop minItems from both power-domains and
> power-domains-names, it doesn't make sense from the hardware point of
> view. There are always 2 GDSCs and two power rails wired to the video
> clock controller and Venus. Disallow passing just two.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> index da54493220c9..04cbacc251d7 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> @@ -21,15 +21,14 @@ properties:
>      const: qcom,sm8250-venus
>  
>    power-domains:
> -    minItems: 2
> -    maxItems: 3
> +    maxItems: 4
>  
>    power-domain-names:
> -    minItems: 2
>      items:
>        - const: venus
>        - const: vcodec0
>        - const: mx
> +      - const: mmcx
>  
>    clocks:
>      maxItems: 3
> @@ -114,8 +113,9 @@ examples:
>          interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>          power-domains = <&videocc MVS0C_GDSC>,
>                          <&videocc MVS0_GDSC>,
> -                        <&rpmhpd RPMHPD_MX>;
> -        power-domain-names = "venus", "vcodec0", "mx";
> +                        <&rpmhpd RPMHPD_MX>,
> +                        <&rpmhpd RPMHPD_MMCX>;
> +        power-domain-names = "venus", "vcodec0", "mx", "mmcx";
>  
>          clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
>                   <&videocc VIDEO_CC_MVS0C_CLK>,
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

