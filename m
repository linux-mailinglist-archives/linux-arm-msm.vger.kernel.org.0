Return-Path: <linux-arm-msm+bounces-92251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QM1rE5SxiWndAgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 11:06:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EF110DF83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 11:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2F0F3045217
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 10:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C641B4138;
	Mon,  9 Feb 2026 10:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U3JLx8im";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kgPlTu0k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9093081CA
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770631328; cv=none; b=q79M60tjacZiREq1K9fQR4FI4NHZI66AAuee+Bev25j+k9bJ/H4J5AdsxwcWOh6YjqsYwIk5114MMtU2JtIoU9rlDcdOIa7Vmo9jlfllToa3o4EcNyAjFHL2Os3jA+la9qvUVQJFdc0y+GTckyiNSjKSwjt/LPogfhoaV04scY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770631328; c=relaxed/simple;
	bh=4I8Rj4xdRSi6MgOmKDp0OJvfaSV82CLZozlzfRNZGMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K//JrBHoTAHwTicw9OXAF4IMukXxdCiVt5/nmQyTPca4DK1Rew6qK1yLmx0xmYhJVJdbA43mQH1XfG8XeHznA3pnT+dwmETqxjzn9Cx15Uv32FH3/L5/WIU7HlqPkh3MbndzFlqZO4t17M46p+LCd8TCQ+O3Lkb8uOQiZ6+ZgZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U3JLx8im; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kgPlTu0k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6197PGWN1573051
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 10:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yb2anyFFGxIZHNV3t37BBz09EsQwC/cS6s/T5HaX8CU=; b=U3JLx8im9dp4Riuo
	lT9No2Emd19Dg4kO3o8wDO8Zkrsp5VehRcKcufbh/jwcEHySTnV3wsT6vZihtUtP
	4KJ7Lz2IvfKEpb2RNOx8Dt9AIap9yyGjfPjdIqe5uh8ujgzJlM0FKAifK5HMM8L+
	hSr2a1+B54Qhhbx5hTU1xumnyKDnlMWpm1lew4CQdZ5dYN1tJUpvsWIrOUFK0YOx
	9gV2qoJ/WAElAv66TYzEroHWSvL+ocWZ62tprs25MruyPij2bIWTNg4+b2QntPd/
	jtU7TPMLm4MaWgw1INQ1RPBIiQvWJ2O+HKpcCmcNGL9H2jsZMvnEUpYvZpP/tZZZ
	d+iRLw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xdevptr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 10:02:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70cb31bcdso70406185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 02:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770631326; x=1771236126; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yb2anyFFGxIZHNV3t37BBz09EsQwC/cS6s/T5HaX8CU=;
        b=kgPlTu0kl+t/+2S/KtrKfQQJcLXm2504C36zfRuda21JLZTTwmwAaqwJkQES18AT/T
         2tRidOyALMK6SZn11mzSh8azT21glXHLbIh4dBshKOOWys29FXuqtAk992D45ec3VIzU
         a0kj5bKQ0VJVIDhjYr0EFJI0BQw1V8oom4dLWrF42oEex8nJ155RX8IzG2999SE57sHZ
         gYVtND21ewqpPka6oHr3IG8q6w1IUzes8An4Z3Tu9woQ/hVuUVq7SbWJmS4cwHP7+CcY
         ZaUqtFeW5VckGYsjaEi/pmtmaFQWWWiZPTcbM5hC8aXU5jtQl4/oAt13C6jXFQdHFXCx
         iu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770631326; x=1771236126;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yb2anyFFGxIZHNV3t37BBz09EsQwC/cS6s/T5HaX8CU=;
        b=AYYZhtJeDmXK+EluDhhgjBFyWIf22h1/vSrn29pt9/Owin2bnIqz7t7Efyy1/soUJA
         WtxSITYKEueDpoHf6/vrUEBd5R8RZ8K50aCnIKoUrN/uznVQHNYDh09yY7ZdZDhI5YV1
         cZoGk1IfFAVDoJcgfkFfMr7lgvcBh39jeliuqtyHUw6fdxsuXqIfVZyuiD78Hq93EpGd
         PaknXaEpjjUDK5D1M3PufyxkkRZN10wco7/wxoygFxIkw33y/kXgIys/IrGANBRnBWIy
         BPwZDTmyaEmJ6GeuSDuARs640V+mfQO0A0mkshezKNUw85vQ3JqEJRUpdhE0CGqQFn5O
         6d+g==
X-Forwarded-Encrypted: i=1; AJvYcCU0DKhUzHQQ5eM4C07DomLkJxrBqkrieaqvk2N8RIfxRjNfsWUryNA3YDLsnIzSihRYH2prEWlmyw/jq8sp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Z06eG11ktCjLh5BJtxopeL7Sj+7Nxu29mQzN0VUuFJYhXkDC
	8MkBDVmFN13RPcnRavCjqu68e4NY+mLQ/CWRKUd+EdlgHlvs5ew09lmzf0TVLUR1Q3hnm5RjwYQ
	azCFERN8/kPNTUK3rAUzbVoTwS4LVVBZ+C2v13r8NjPtKX9qLKwVQFZTvSHJb7cynuHi0iHWLkV
	YF
X-Gm-Gg: AZuq6aLh0z7kJJpPzyCDTecXftTPcNs6Bk58sswqz3n7PqFNqS07gSbZ2BSBg41BAIu
	Oaa3uMNhcPJF20zjE3GjfjWf6c9M4IlRPfwmzDXfnvXCDtlg30GYQQD7GwLUR5M4tiYSAAeerix
	pt/rblqcSJBbjzGJNHBWCYhcpX496auz8N8Mj5cvTJBkG3JtZ69MHcK/cvo80z/Qd+PQJ1JHioy
	9g2R+jskHwhWYUvOQukLVR/Q8fNX6OkHT12KLIULyVPrusi8fLmNbhnrOJp0ns5Ay9zcNY3utUY
	R146PxeMNIgMdvzZIF19rZMgojAnhIq0cGxZDEOwxgRSHuwutAJqIrnjn1KSdtjYaIXJiwmji/S
	h07ufM51ShceKwJCADrPTKh6884waE8yuDXdmIDJe9TOu25YOsfzr099yLWRN7LQG6cA=
X-Received: by 2002:a05:620a:4110:b0:8c5:305e:ea16 with SMTP id af79cd13be357-8caf0d3d550mr1074442285a.8.1770631325937;
        Mon, 09 Feb 2026 02:02:05 -0800 (PST)
X-Received: by 2002:a05:620a:4110:b0:8c5:305e:ea16 with SMTP id af79cd13be357-8caf0d3d550mr1074440185a.8.1770631325520;
        Mon, 09 Feb 2026 02:02:05 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edacb1d3fsm358203266b.34.2026.02.09.02.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 02:02:04 -0800 (PST)
Message-ID: <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 11:02:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ddcaa/tW c=1 sm=1 tr=0 ts=6989b09f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=5I6DSIVO9Q-7lEmBOwwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: neOGtx_OLkDGFikYV7sB1_BdvOd9BMdZ
X-Proofpoint-GUID: neOGtx_OLkDGFikYV7sB1_BdvOd9BMdZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA4MyBTYWx0ZWRfX/Jvn6LvUwLT5
 yAYMzxL7lMyXA2rDR/lOrTGHuVAriQVhdXAlFrlA6P4CL3SNhwm4F3iA2zaQFejosr2OarhvoBh
 +/DiR11u0udPv30aUQoS47KWb9nLm2pbV/5+h0/nVhLPFG42Mok2FE9eoZ5GEVkzDmnCj8KBC+2
 mgc2oRNhjYBb/XjDTgHGt4KpgerUjrh11HYqJDwHRLP2/bIydSdJ67BMZR7MA+JmeYVEbTtRg+Q
 OpuhVJK8zXYVNRRDkz5c7PzjtVUF9sgonzb/mA4zhXJVABp4ZSRkkNWv5Bkly5LJWV5hmCg7xnz
 eY9QDcHdJImGtJfxuYV6i6c0K/moTAbJI225bParJ2/vLCEUHOviIoRgXUQ6HsIZ9rdB5lX8bFC
 B374YdjXsws2ZCIZTA/H5Awr8lVNYKXQKxJS7wk2i+vuRU+4ZndFrDDg9es+GfiquVTKGUXETB3
 jZ6IuB2ZENNjctxiDBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92251-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 74EF110DF83
X-Rspamd-Action: no action

On 2/9/26 10:45 AM, Dikshita Agarwal wrote:
> SC7280 supports both Gen1 and Gen2 HFI firmware. The driver continues to
> use Gen1 by default, but boards that intend to use Gen2 firmware can
> opt‑in by specifying a Gen2 image through the Device Tree
> 'firmware-name' property.
> 
> Based on this property and the availability of the referenced
> firmware binary, the driver selects the appropriate HFI generation and
> updates its platform data accordingly. Boards that do not
> specify a Gen2 firmware, or where the firmware is not present,
> automatically fall back to Gen1.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---

[...]

> +int iris_update_platform_data(struct iris_core *core)
> +{
> +	const char *fwname = NULL;
> +	const struct firmware *fw;
> +	int ret;
> +
> +	if (of_device_is_compatible(core->dev->of_node, "qcom,sc7280-venus")) {
> +		ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
> +					    &fwname);
> +		if (ret)
> +			return 0;
> +
> +		if (strstr(fwname, "gen2")) {
> +			ret = request_firmware(&fw, fwname, core->dev);
> +			if (ret) {
> +				dev_err(core->dev, "Specified firmware is not present\n");
> +				return ret;

This is fragile - if someone names names their gen1 firmware something like
"myproduct_gen2_vidfw.mbn", it's going to match..

Could we instead do something like the explicit format checks in
venus/hfi_msgs.c : sys_get_prop_image_version(), based on the **contents**
of the binary?

Konrad

