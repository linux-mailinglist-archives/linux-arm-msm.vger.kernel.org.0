Return-Path: <linux-arm-msm+bounces-93422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AlYFJIwl2kcvgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 16:47:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B96E160585
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 16:47:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FC263013697
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 15:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C0134846C;
	Thu, 19 Feb 2026 15:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNREgYxm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jyvCCGg6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B850346E70
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 15:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771515809; cv=none; b=jqPM7dpq5/KBkgV57uvwjC4VBhHnG8JcXkvpMAmtUhtJtD/0rhltK5tCm5AXrRWwjy69qa2+YIAW3S2AJ0Z6XVq07eMv37gFqZXqQn7sZQqiAMM/oPzsopONFWOXBT9kgN4dsW9G+vFXUqbaVBzwpgW6QTRq1BeoE4uNS+/aCnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771515809; c=relaxed/simple;
	bh=pCEKJZFMXA+1C9kQtbelG6GXaxgDthozhWHG0Rgma/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PTZtrBe6HOlRyPo4VRSLTgypw+ViF6NZRtFUWCSMCFoccg3GEu0bbtRPOIe/u2FUJ8dpiZNxX/W1KBJAsum0ID+6uQR3H5mzvref9Q9wft1/brINPajSWVAdgCRhidnjg1LhOC1LVbA3ZBRlY+GY0a4dmCe9eJKtQiSj/M/n9kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNREgYxm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jyvCCGg6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JAePQe2004670
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 15:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t67q4H9UjuW+7y3pKXaBfsGuu2Fs6w34CocIq5T6rVU=; b=KNREgYxm64jFsrX6
	f8RE/A1uW5oAMtBICuZpPLZa0Oxq0OMgwUSdqrggc6KVCewjlGQRig8VEUqAA66L
	LG8480CkxZK2jTOMjzHCDsxxgSoav5yKUzX6cF/OwfkUYkSJZFrXBsBpdd3iejQ5
	aA/eB6xK5x/yg3iEcdm72M29bjoiBUa1zJh1U0Pk07jMj+3oEnDz2uwlZwSM/oza
	EJc+RhKNPuaj5b31NTMEDZRIAIAPo4rxS9H5RR+NEWkSNf2sthwg4IvVGmd4Nh1D
	J6/wTEhnZq+/dsjvBpmcQj+VZcgIJ+Nkjdd0uZ1df8arcyLEPNfmvQBO3vZGxnro
	FbsT0w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdn1qjfjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 15:43:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70c91c8b0so89500485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 07:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771515806; x=1772120606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t67q4H9UjuW+7y3pKXaBfsGuu2Fs6w34CocIq5T6rVU=;
        b=jyvCCGg6OpEJq5ltgRr17zrWOjNoBq/0VammZtCuJsOJGKiSyIFDyet3/Upn6ycSnR
         oBUacv8Gd72yvQgdk4yRpaSNhAAQ4RsnkWj5xE2gnRijH5RUTnlafjUdZpudUO4AjeTI
         dx3FAS9h8JZYfew6feY4rhXSZd8gTdfv9ECuVpJG2Zgzp79u6Qx0ufIGkAXLCCXALGpx
         VmtrzfAzm/L3tS+u1q6gzi/mE9WJrUjdmzVYL4wODiKlXkNRBID8AktE0Xr9cmfTSHmD
         sqLoU0n3IRW17BRhQpWphQLdaQK7z8frhLbz7tbhL2Sy8uJsdw7goSfQcrU7BJWhm3km
         lNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771515806; x=1772120606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t67q4H9UjuW+7y3pKXaBfsGuu2Fs6w34CocIq5T6rVU=;
        b=wDReFYlVe9ggKkvgYT2AKVZQYgSoD1rnbnz2AC6uSdY9XabCeBMHjyRoaOUUHXIbL/
         l7joyjwxF65Wgl390Ui5F37g/C1FNIrMMxlewtYlgk1EB0Tjbp8+irVNJWvLfzMPcYUG
         h5E2hizmMirD1btE/LhQYDVCyBXG0WlaHDvstYr7d2m612eDpwlcZVUr8DCtm3SvSJYD
         Iiuh5kWpWFIPkXEzFzi4J/xGlHbPrWUvumfm50CmWkKcR/p2zqolfI/sTOeAKxI6kc0Z
         +ImIRjcs96lR2EFDxYYtKhEpmOYXDGt5CnLtw1r11rqPzmLc9YYX3bG1X1aykKHflMyu
         iwvw==
X-Forwarded-Encrypted: i=1; AJvYcCWBmq+iqLctAe8SXULgAMi3r9C/ZM2SAGCbreFJ0O18Ham0W4MFyaWm3IkEjztwZevKr6EOjI89W05W3Bp3@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqo2ZhIm0nUU/9FYb2rroP3FKBvmw4eLR0hW+gks4mIA0XrNW2
	OREFp7VD/txsAv9vHGupCQ5YH2QH5hfrChlABQ3bx+v2zQInHwSTj07xJGm9BBIaQC5WLFohRvV
	yyxUO0X0ioK+YpXSoFzMfex/lSnvyFb/dZrajnoFX4KCv6+uQeT6/oGZZyIzlEUdxtGQ1tSB8ex
	JZ
X-Gm-Gg: AZuq6aJbPTSQQyYUH9yvDb283Qp4NFU05ZU4rn1Mz55q07m9x5/sdLRiIc7TUjaIBSw
	g478UZPhh539ApF9l65cxGSZH9jDdGTOTYbAj3oYeGVleEoVKUIDjqrFxHc8wE9f6xDSJLu5VOE
	Jl8S0/2hV9m3qUFACrKrNm84LpZ9UuSn9f8gx1y6yLiiy84+napQRkT8KpEf96IYV16/LDr+ZXO
	UVHB1Dzn2BFOVuaKU4PFOuRSAqPgK64h/I8lrHlcLFxh/KWkbLp8UFKoY96ObbbLjJJdwmSsO4R
	9DL2ArQ2SzcnTzzgmoLRvoHM09Pj7hi6y0gFID1E/Kjj2g/qI8PnBzArf2MpDb8mRPVNoIrSC8N
	nkDWu154XMjtij59J6g2fqViRURaM/LuZuD2/gqm0xghIkOIng4l7rKRnLsNIy6/X38EJ929g0H
	D4/SM=
X-Received: by 2002:a05:620a:4410:b0:8c0:cec5:148c with SMTP id af79cd13be357-8cb4090644dmr2013587385a.11.1771515806439;
        Thu, 19 Feb 2026 07:43:26 -0800 (PST)
X-Received: by 2002:a05:620a:4410:b0:8c0:cec5:148c with SMTP id af79cd13be357-8cb4090644dmr2013583785a.11.1771515805834;
        Thu, 19 Feb 2026 07:43:25 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73f576esm574827066b.28.2026.02.19.07.43.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 07:43:25 -0800 (PST)
Message-ID: <a79efce6-10a5-40ec-bf5d-f37b2bf29ee0@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 16:43:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: qcom: camss: csid-340: Enable PIX path support
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, bryan.odonoghue@linaro.org,
        rfoss@kernel.org, todor.too@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
 <20260219152737.728106-3-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260219152737.728106-3-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Vu7yQdMZOcvGHDY__obfE-HAnbNE632u
X-Proofpoint-GUID: Vu7yQdMZOcvGHDY__obfE-HAnbNE632u
X-Authority-Analysis: v=2.4 cv=c7umgB9l c=1 sm=1 tr=0 ts=69972f9f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=zcQ4GcgrSeTMVFIImlcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE0MiBTYWx0ZWRfXxksTBvE2IAfy
 yxYlAuWF9VsglCDvxu7tKNvHKou9tIzuRtIHATja5CXq6IjgIUvTehRyFeKuU5ssZy06T9/MyMv
 iA843wl5MObfdo2SKp+t0D+Ti58vwE8MWiJCkr7c9PLyeoC/t0jJyXUzONvldHis5mVqqjSgqde
 6dj13j26m7WHSAoFh1+3TKID9AnmAtCoqitWhqdiaVUa6M0k6y8zTgBbCsaHEvwyxamiLdgeGsp
 5LjZ/Jp6nyWUbStwUm4I09Gy53R/mIsV9C3EL0iJuXQCvSDn92EVs1na91ggNW8WZs+mEWcMASN
 aD3AaBpMhUsGT49ZmnA4lvNCILi8fc/OmFAKCJVpjYk9gHLo8mkN7XIoc+opx5w+YVC9Iu3EQds
 BFVt1wxkFY6rRKMcKHZcZiDgmz7kLEwTXXe6NNflU488TRCFwip22PjTMLeKW/0Q3vuA1iBeb2S
 amB+SRyexXATXt5izUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190142
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-93422-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linaro.org,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7B96E160585
X-Rspamd-Action: no action

On 2/19/26 4:27 PM, Loic Poulain wrote:
> Add support for CSID to PIX interface.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

[...]

> -#define CSID_RDI_CFG0(rdi)					(0x300 + 0x100 * (rdi))
> -#define		CSID_RDI_CFG0_BYTE_CNTR_EN		BIT(0)
> -#define		CSID_RDI_CFG0_TIMESTAMP_EN		BIT(1)
> -#define		CSID_RDI_CFG0_DECODE_FORMAT_MASK	GENMASK(15, 12)
> -#define		CSID_RDI_CFG0_DECODE_FORMAT_NOP		CSID_RDI_CFG0_DECODE_FORMAT_MASK
> -#define		CSID_RDI_CFG0_DT_MASK			GENMASK(21, 16)
> -#define		CSID_RDI_CFG0_VC_MASK			GENMASK(23, 22)
> -#define		CSID_RDI_CFG0_DTID_MASK			GENMASK(28, 27)
> -#define		CSID_RDI_CFG0_ENABLE			BIT(31)

Much of this patch is renaming, could you split this up, so it's more
obvious what it actually introduces?

[...]

> +static void __csid_configure_pix_stream(struct csid_device *csid, u8 enable)

Perhaps that's yak shaving, but I don't think enable should be non-binary

> +{
> +	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PADS_NUM - 1];
> +	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
> +								   csid->res->formats->nformats,
> +								   input_format->code);
> +	u32 val;
> +
> +	val = FIELD_PREP(CSID_CFG0_DECODE_FORMAT_MASK, format->decode_format);
> +	val |= FIELD_PREP(CSID_CFG0_DT_MASK, format->data_type);

no vc/dt_id?


> +
> +	if (enable)
> +		val |= CSID_CFG0_ENABLE;
> +
> +	dev_dbg(csid->camss->dev, "CSID%u: Stream %s PIX (dt=0x%x df=0x%x)\n",
> +		csid->id, enable ? "enable" : "disable", format->data_type, format->decode_format);

"... %sable ..." enable ? "en" : "dis"

Konrad

