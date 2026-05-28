Return-Path: <linux-arm-msm+bounces-110055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AK3mAtfiF2pOUQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 08:38:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F0C5ED526
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 08:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42EE5317ED88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 06:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B2033A716;
	Thu, 28 May 2026 06:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IwopzICG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QPx6StsM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECE43321D4
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 06:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779950143; cv=none; b=XZzFbNavuqGNW83OiEvDsZJwCZXy6gK+FsVb17qXvj7lvr6czspfLipX41xU9MZAvFiAI7z3AtXgGptwF3w10WqGcSNg/Ymjj815GZoO/fKdtZFqPYgcqsrtTdxL08vltX0PsCRURjWODMzd85ZKlYmABvsZJ89rwFDX7NU0h1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779950143; c=relaxed/simple;
	bh=c9lsraxF7MF5yE6tUfHnBFZa9WWpihdkME3ni/W2xQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6BdF9AHXtU2H58NiqqfplAjds2RD3AL2ODbGPwV4VT+jer5fYRDe8EYa/Ld+LzmoWvq8GhjmdzvQoCSSgGbUQY6v8l54zFLjzHecdHxwAjYceRGZ4jXwxb2wV0w/6nQWqGSTFj/AypoBhGYVcXl2h7y5NaWSm2Nz/UoHKYZdOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IwopzICG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QPx6StsM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RKl8qp4187808
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 06:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ydqXkzCJxOfG9FXBf1HMLa8s
	SWgOAyO7S9cyz0soJm4=; b=IwopzICGE7TpKNQU86K1MoME3hmW3uvZHZGtKirT
	PgRpw1/wuIZaiLUyLcT3b+bpeDna2S5cMyo7aLbepYkECNKaFiXShnZPlHCjXcQf
	9DxIkkeEUIsOvHUvWaol5y3hoM4aiOKd6tZdqnaeDRngdI4oRflzaS6MDe0aCxVe
	KLX0z9MO31T0/y3bUvmxz5eprcSqBhQtVdZJhqTQ6LOt+d7bxOooirkN8g5RdZpv
	TiaHo5YupxK74ASOBrSc3SwprkvwAb0L/kW/u09Zq4JbxKLWEfB8lYdn3sqOeSpP
	H+ER9bXY+Cgarxy+7yxZJObNMTOXGIPEEOntZBQIioRWYw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y2skpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 06:35:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516da5a1db4so127665881cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 23:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779950140; x=1780554940; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ydqXkzCJxOfG9FXBf1HMLa8sSWgOAyO7S9cyz0soJm4=;
        b=QPx6StsM+VoOU5rzYssvMpWJTnQ/IdC1csvTsyUTTClkwj1fylP4EL/gVToJDZnpEO
         DmmiK3eTtsjbAmADXep3aJga0ijelKZgc7QH27z55hGMTG0rAgzsXCvIRXxD4IRjvV+2
         9WovUZTrJbUW/Fjiah1XqDbA+Dnw2iLyYBsHhTtX3s+cXILDwiA7ApnMNXS5U6r2/sf0
         SdHwtHlAH2/+Q8BC4C72uMWXFVjRcTiO2uLHoPZzcr0R5Eim9uXXyZ6LcjhqmJaXUOWR
         yIDxk9Pc8QFwCoz6LdYBNIZMmyaJyji1ZUuuXbb9nTC34wZ5xdEuQCF5KiFSM2jtq2pR
         c0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779950140; x=1780554940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ydqXkzCJxOfG9FXBf1HMLa8sSWgOAyO7S9cyz0soJm4=;
        b=A+k4+8AxYoLvQvsAaKQQnxUkALHjGVFLJZu0e8QB6/DV2wsj1KlBd5hXBUvnT3jOFj
         vCUvPm8FlnDM9fy4iDX6baFPSqRnbfwm9UrdV5+fIbskoi4BhEECOqyhuJEtfWr9cinW
         gAUvVb1OirUuA3W/HUTIprawNncahv6cRDO4Y+3mEs4HJdcaQbEoRm9TDXOq45toqgGT
         4cOKEJ/0a+6Yq66+d/dEKn5a5jZthdmWNGxpPF0XeCAH+E6ieJeF1OwSMGqstoZwd0ck
         UebEZ0VhjFtZwQrG5M4OIZ72G6Equ+w5LTVqkb/ksQw40PLpgj28Mlnp1hWSd+X2G0ze
         l88g==
X-Forwarded-Encrypted: i=1; AFNElJ9uOssETbmMNHj8PAdDrO4wfOl0bqpeuhMqsBuhWrYb3kkgPtUkpwN6emN7h/3WUl7Hj9jzztOA8A7B8Cla@vger.kernel.org
X-Gm-Message-State: AOJu0YwekLXFv3ODKer93J7mrgZXU02q8IUph3vycVMGQF674FFk3YaY
	21u7Nsi+aaL+VVt02t2MHJMa6MvI8ETeUIkrei1UxRJ27rp6HG6alsfI6eIFhVUqTiAaE3oLqnj
	aVZ7w0frZhJyxA2VcFp2CedCkHv5Wdjp6H1iWUGMaG0ANaq6B+sXQqWGY19f+ZFZxzfIK
X-Gm-Gg: Acq92OH2o4mYmC7kuDO9i49qw6R++HI842+CNBa+gdw8MhARnyhKfGgyV5+er43Okbt
	GCkwhbgr+B+yBam/uGWvThEy1NMjHFbEclr+bYH6PuG4pYKSORyJ9hHSkNQnrY88WUhClJN0zJg
	WKH5Z2z96R9T48DmUMYMQMnlw1LaHt+0uQ7oyd2WRqI/xH8D7PJR7a+1nBbArYkEuxSJZMdKkJD
	PrHs5l9fNSJkCLce1OeVCqDJ3C4yynP4ucZB0CzGcCiD+h44JhZ/8DC5IxXa+RHo0kph6EYKBND
	wAp0uxv1OpiMyMtEpJdvqvuifLcd3X2MZhNYspOto3Ngn9n3bE82dpU4lE2b3+HFx20z5LD2Rc2
	M5ajhseUYSib0fheksF5j8KqY/BTpZGSbRtJ+h7NVOTPu1IJVNuinCUxFnfYvbEawwIu/BDLq33
	CRc0GS94xCY4XVKYB4zkJJX3Zn3SE7zOPRoOLFqukbqWvmfA==
X-Received: by 2002:ac8:7d47:0:b0:516:e0bc:f485 with SMTP id d75a77b69052e-516e0bcf5f3mr290292051cf.30.1779950140570;
        Wed, 27 May 2026 23:35:40 -0700 (PDT)
X-Received: by 2002:ac8:7d47:0:b0:516:e0bc:f485 with SMTP id d75a77b69052e-516e0bcf5f3mr290291721cf.30.1779950140011;
        Wed, 27 May 2026 23:35:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcaa226fsm35385481fa.18.2026.05.27.23.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 23:35:38 -0700 (PDT)
Date: Thu, 28 May 2026 09:35:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: opp: Allow optional -vN suffix in
 opp-microvolt property name
Message-ID: <wwzqpnkhdepkgl6bdmcuwep7v5m4rb6h3vfdbqmphxvmw4ao2m@efgv7wvm6cty>
References: <20260527-expressatt_cpufreq-v2-0-b9b7726ccb6d@gmail.com>
 <20260527-expressatt_cpufreq-v2-1-b9b7726ccb6d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527-expressatt_cpufreq-v2-1-b9b7726ccb6d@gmail.com>
X-Authority-Analysis: v=2.4 cv=VeXH+lp9 c=1 sm=1 tr=0 ts=6a17e23d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=jtOVCDSMMUdUVPAGS_cA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA2MyBTYWx0ZWRfX9necMyn0q6U0
 Qo9AWSL5KOUqAatArPAMNT1Bl345dOlaLjnMYKsQxCMbQhndhpC5nEG/lY1dAPvJL0MshIgKvup
 45iW2KPgaSua7U/5+0EoMEPXSyBY2ddP2WZiQpRPCI36PLLOg5yiWHStMUkdKFR9uSFo42Ibqyk
 vDWCXzGhZdtlMcXXhbXev+nOCzJsVMXO0tbyL9mUe914d68a5Q1LdweLuY1HOi53mxJEUDXIrQ6
 Uk7ePqjPYc08Lvaq+EWISn6MncpJMiCKsSZz/d+4bJxkYSPtgZOprZAbsPJ5Qt5pkIWFI9VoFQu
 GfcVahzrlGlKWqJ1QKQipjU2MyQGEIokt7QRRZYsqFroyLWnrMvZWActHMsOLToUlGnKHOSphUR
 h76p86euUFzuO3oRM3gh4SgygKxTBuSJ1k+dPZX1/yQxz5djUpRxZN/HvjEmpQJPjtcd10JM6ZA
 dp70u6JopcmQbpG1IZA==
X-Proofpoint-GUID: DvE4P_bDtlk5A-Yri2zEnvNtjoT1dv3k
X-Proofpoint-ORIG-GUID: DvE4P_bDtlk5A-Yri2zEnvNtjoT1dv3k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280063
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110055-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A0F0C5ED526
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 08:39:28PM -0700, Rudraksha Gupta wrote:
> The qcom-cpufreq-nvmem driver generates prop_name as
> "speed%d-pvs%d-v%d" for Krait SoCs, resulting in property names like
> opp-microvolt-speed0-pvs0-v0. The existing schema regex only allows
> opp-microvolt-speed[0-9]+-pvs[0-9]+ without the trailing version
> suffix.
> 
> Extend the regex to optionally match a -v[0-9]+ suffix so that
> devicetrees using the full prop_name pass schema validation.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml b/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml
> index fd04d060c1de..846f49a99484 100644
> --- a/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml
> +++ b/Documentation/devicetree/bindings/opp/opp-v2-kryo-cpu.yaml
> @@ -81,7 +81,7 @@ patternProperties:
>        required-opps: true
>  
>      patternProperties:
> -      '^opp-microvolt-speed[0-9]+-pvs[0-9]+$': true
> +      '^opp-microvolt-speed[0-9]+-pvs[0-9]+(-v[0-9]+)?$': true

I think this should be fixed differently. There is no version for
MSM8960 / APQ8064, per design. It is only applicable to MSM8974 /
APQ8084. You also need to scale the core voltages.  Would you consider
picking up the relevant parts of [1]? (also see [2] and [3])?

I got stuck because I couldn't implement L2 plumbing properly and never
pushed the series further. On both MSM8960 and APQ8064 we can scale L2
cache to follow the CPU frequency. I tried adding the driver for it, but
RobH requested using cpu_subsys, but there each cache device gets
created multiple times. Maybe I should fix that in the end, then we can
scale the L2 too.

[1] https://lore.kernel.org/linux-arm-msm/20231002185940.1271800-1-dmitry.baryshkov@linaro.org/

[2] https://lore.kernel.org/linux-arm-msm/20230827115033.935089-1-dmitry.baryshkov@linaro.org/

[3] https://lore.kernel.org/linux-arm-msm/20230702175045.122041-1-dmitry.baryshkov@linaro.org/

-- 
With best wishes
Dmitry

