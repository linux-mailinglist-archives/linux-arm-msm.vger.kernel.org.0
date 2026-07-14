Return-Path: <linux-arm-msm+bounces-118991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Otc7JGb1VWquwwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 10:37:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 922447527B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 10:37:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BCgoSYeH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bdJepPXB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118991-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118991-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A4B93017FA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344B327A91D;
	Tue, 14 Jul 2026 08:37:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2603FBED8
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 08:36:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784018217; cv=none; b=c8aa88bAV2yhSS9zGLV3WSVTHRTFauqXTgB7x7WARZu1jyBZ1FC2NapPcH4A8QstvMz87gI6J9GDA0/+urD7R/t0rSOB5Mwlg8KrqRs87LuPq5ZQIBuj1lPQgs4b2JYEMh/o/fMpA1ZjcjeGXOlKR7a1JRh6yxn3hgflYHzd0x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784018217; c=relaxed/simple;
	bh=5kwAURwLzKnipG3wH6US78oa4XN2T1xv3YpjxSgBCz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y2Ldr5KSaBE1LifJSEBjaif58YTF5LuTJ5uzw1yW8j33Se7RL4zuUT3a8x3nKKEYMof1fIr7iF9hOFSfbOm1CnWcrDkKHRloNg2N58KOMHmq1I25VaYmqUny35y71oMW480NpvzdwHsCZMmoNlkPe1M5GPEWX+yYYQHO+ezVQIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BCgoSYeH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bdJepPXB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6STc03743651
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 08:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UwBNga795puXbc3/E3BKT1/MAXsIt0OOfx/O6w3VlJk=; b=BCgoSYeHHGQgkdkU
	G90Lbo5hriKaL2CdV1bqdo/Cbfl54IPm98d5a3xMsSxoQbkynrXs93oDRzZb2eN9
	xtflhwqtNJ8/Yt3vDFmj1cyM4GtsSRIU8YJpOQZzQOABsea0djY2Gil25H7aBbS7
	rmMHl8xSz6oTRlEshnDgCClxDVirZm3IEYCT68SHaS2lqZc2QZyHkC34nROPOY29
	fEs0ZAfXKm+4IeZYScqUBRUUuKhkHoEmcO+kmkbwpWiuyTLgvbkpKgqGO99U+deG
	88599Al0HV9UdOEt9XuDVx1xAH2Wpn2zSMjbezKbVjNVwMEDtTTZ34wZlINu5pFj
	Wku0yw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p2t1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 08:36:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bec738909so34239481cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 01:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784018206; x=1784623006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UwBNga795puXbc3/E3BKT1/MAXsIt0OOfx/O6w3VlJk=;
        b=bdJepPXBU1ua7kHJkiFvYcoLKMP6OXaTtiV+Mhuvnf56PjygC1JvZhhBsRdu1q7hAp
         +OLViTLdZVRGp1XwYs5SCdGntkhmsfB3JoeAmhA0rkce/zaQmm2nkQc6KTsekwuRC/6i
         ZUcC/80zhp2DZ7BwF5Nj6yc5ONHJekgBu5f6TYNd+bv/z/PphuYFBXZrzsket+TUyWde
         enhGVj0jvZ95bAIFTcM0y9QF+2aBDL1X+qhBnz6KTPm1b+4aYt3IqT7vRKR+kqD6skdd
         mzE7pxoqTcX7jvYJk1Q4GKqG/5Yg4F3MSVfK6+hi8/QEsczSXscDt+JgoEvDbRoonmuX
         Yc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784018206; x=1784623006;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UwBNga795puXbc3/E3BKT1/MAXsIt0OOfx/O6w3VlJk=;
        b=CfoaPo/7g+xx9s+5JS6yksB0cWIiG3tXb4P9tgbeRKeOQqHk1+lXoGOx+xrmN5+Wzj
         bigTPgZ3eJTMaxy+lezZuo0Ngfyzzri6YZcTGi6eMbI+s5HNE5RDTddWtN6661LhhTsT
         6H9zbSm9/gE130aqOSQKB6TvXA+QzO8YAclww2RbL8P0jtM81TCOx64NP+EnJlKHRu7F
         grQWiE+5CYzwM+ao2yL6dmRE03In3r2+S8roH6subhXeX+DcWKyC3lSupty+cHZ6yqj8
         yJtnR+9uGy2mR1cLeA6op+MbPjpUX3SDEdNP1/ev/DVgY5lW6XPS/EE1ndEbzeW5vFs4
         0XZQ==
X-Forwarded-Encrypted: i=1; AHgh+RpvUE49NEQQRiSYoUKdSpRM5iiKZAsCfqYOFDQmHpd4322Lrgpf/Cbo8T2HxterKfaYjsSH+scYmPnyXyu+@vger.kernel.org
X-Gm-Message-State: AOJu0YyMn1TV+3LhflhFVk4mjCRAB0VT4MOlpfNoMnff1ZKbTbOHnkEb
	FQbwdbKAq/WtO5xQWmRqmsqEMI/bJUQiGGB5vYuna5L2gi06HVjA7vMN6mgRkjAXPc3AMREde33
	Vz3h0ucRyzigb6kjm8Sw199EP91MXxAJ+L+EXuGtjTO0Nx4a96ktzbz+bGiTmdD/QIkK5
X-Gm-Gg: AfdE7cmruxj+EvWO9p7NOuf6CPgz84tZxN0ozBMRbpeDqBPULpkvZ9U9QezHqfCzUe4
	l0+/Gnk4q3gILeJG7nuQPTyp8MdBop6hI4Ve2A1rBn1Ns2caj+5cZLMqxvZcHedzjeRuHyANy0q
	0islzZOEefl8ktsAsk//Y50CfJ75FrEt10TcBYfswDt6qQYEpJGtpZzQGfvDGpCZHu+ZopiNDZf
	K1pMUo3n8iByN3Zirxeax0StomXsRGBl+tKdiz9YYt95d8hy31D2GG9Me6d0eMIevs6XRlPabPN
	txsvm610Qip/26DO5sEv6heNzx3Po6/suf5Mw+9nakxpIfsvLyxuYA7IA01n+Z+zTlayBSJOjQb
	n6bOgXGBO0oIIhWFJ3HO+XCucIL3o4BYThKltRw==
X-Received: by 2002:ac8:7f13:0:b0:51c:7b12:5feb with SMTP id d75a77b69052e-51e424c5b37mr9038141cf.87.1784018206064;
        Tue, 14 Jul 2026 01:36:46 -0700 (PDT)
X-Received: by 2002:ac8:7f13:0:b0:51c:7b12:5feb with SMTP id d75a77b69052e-51e424c5b37mr9038031cf.87.1784018205689;
        Tue, 14 Jul 2026 01:36:45 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f464a974csm7946955f8f.18.2026.07.14.01.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:36:45 -0700 (PDT)
Message-ID: <5f5287d9-1991-407f-a3d8-7649f41a99bc@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:36:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] ASoC: qcom: qdsp6: q6prm: add Audio IF clock IDs
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com>
 <20260712134110.3306763-5-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260712134110.3306763-5-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA4OSBTYWx0ZWRfX7ahYzxtTeTwY
 ZL8osNd5oErJ5u5TyIXbSviX28T6Kpnbxe7zMyoWC9VG2Gli4P7BOrXnesvyRVSDFFdDCehvVgy
 O3dKqzaLZxNfAvmznCUccZ+XTx2CrPQ=
X-Proofpoint-GUID: QmIH4CxCp17qCBhvQ-wNav_vLHS2iukJ
X-Proofpoint-ORIG-GUID: QmIH4CxCp17qCBhvQ-wNav_vLHS2iukJ
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a55f51f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=TEPkYXQ_7zv5l7E6eUIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA4OSBTYWx0ZWRfX0hWeQolOmw71
 11YzfXTMSb1+es5KpNRj3mym5habNfLOIMc0vipfl6hVd8lwER26NrsZU2WcLyThtdCfe+y3/3r
 M7E7b26oDq9u5hGp+letAP2bA9X8SIMY5UegyclhHE3EEzvng/0goI1IgrQS/qLrWpog6y6LVJG
 KQDBAzkYWm5TZpg0FSW+4WsEErEUbpV0YOafVY8bxezq5QKqFo0EiouLkbdynRnz6vJclxcoagx
 wVEl4qsKNujvupWAe6vDHgmSZ4n2Vswj3TzXtoKC6MFnv4uKW7JzlOBBeJ5ataROBhFHMUOM6br
 oueYzfIVxcSdGxiOqCunnEtO0dIedviW6lGok3vDYttsESj+KTSP1YB4OJGe/0hzBbNIXrYJef2
 NqtYm5CPi1VtWr7z6tsvrjGdPSpLVTQS4hHRqA0QhRkDCfTYNu6SUmmfXwfOrvlh1tDR+w/rWhC
 aOBQxa0SQy0FpXCwXYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118991-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS(0.00)[m:prasad.kumpatla@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 922447527B5



On 7/12/26 2:41 PM, Prasad Kumpatla wrote:
> Add the q6prm clock table entries and internal DSP clock IDs for LPASS
> Audio IF backend clocks.
> 
> The public binding IDs map to q6prm DSP clock IDs starting at 0x500 for
> Audio IF0 IBIT/EBIT. Add the internal definitions and register all Audio
> IF IBIT and EBIT clocks so machine drivers can request them through the
> APM clock controller.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

lgtm,
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> ---
>  sound/soc/qcom/qdsp6/q6prm-clocks.c | 28 ++++++++++++++++++++++++++++
>  sound/soc/qcom/qdsp6/q6prm.h        | 29 +++++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> index 4c574b48a..38354ca8b 100644
> --- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> @@ -59,6 +59,34 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
>  	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_MCLK),
>  	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_2X_MCLK),
>  	Q6PRM_CLK(LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF0_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF0_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF1_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF1_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF2_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF2_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF3_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF3_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF4_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF4_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF5_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF5_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF6_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF6_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF7_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF7_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF8_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF8_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF9_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF9_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF10_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF10_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF11_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF11_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF12_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF12_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_VA_INTF0_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_VA_INTF0_EBIT),
>  	Q6DSP_VOTE_CLK(LPASS_HW_MACRO_VOTE, Q6PRM_HW_CORE_ID_LPASS,
>  		       "LPASS_HW_MACRO"),
>  	Q6DSP_VOTE_CLK(LPASS_HW_DCODEC_VOTE, Q6PRM_HW_CORE_ID_DCODEC,
> diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
> index bbbe6d368..1593f6bd4 100644
> --- a/sound/soc/qcom/qdsp6/q6prm.h
> +++ b/sound/soc/qcom/qdsp6/q6prm.h
> @@ -87,6 +87,35 @@
>  /* Clock ID for RX CORE MCLK2 2X  MCLK */
>  #define Q6PRM_LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK 0x318
>  
> +#define Q6PRM_LPASS_CLK_ID_INTF0_IBIT		0x500
> +#define Q6PRM_LPASS_CLK_ID_INTF0_EBIT		0x501
> +#define Q6PRM_LPASS_CLK_ID_INTF1_IBIT		0x502
> +#define Q6PRM_LPASS_CLK_ID_INTF1_EBIT		0x503
> +#define Q6PRM_LPASS_CLK_ID_INTF2_IBIT		0x504
> +#define Q6PRM_LPASS_CLK_ID_INTF2_EBIT		0x505
> +#define Q6PRM_LPASS_CLK_ID_INTF3_IBIT		0x506
> +#define Q6PRM_LPASS_CLK_ID_INTF3_EBIT		0x507
> +#define Q6PRM_LPASS_CLK_ID_INTF4_IBIT		0x508
> +#define Q6PRM_LPASS_CLK_ID_INTF4_EBIT		0x509
> +#define Q6PRM_LPASS_CLK_ID_INTF5_IBIT		0x50A
> +#define Q6PRM_LPASS_CLK_ID_INTF5_EBIT		0x50B
> +#define Q6PRM_LPASS_CLK_ID_INTF6_IBIT		0x50C
> +#define Q6PRM_LPASS_CLK_ID_INTF6_EBIT		0x50D
> +#define Q6PRM_LPASS_CLK_ID_INTF7_IBIT		0x50E
> +#define Q6PRM_LPASS_CLK_ID_INTF7_EBIT		0x50F
> +#define Q6PRM_LPASS_CLK_ID_INTF8_IBIT		0x510
> +#define Q6PRM_LPASS_CLK_ID_INTF8_EBIT		0x511
> +#define Q6PRM_LPASS_CLK_ID_INTF9_IBIT		0x512
> +#define Q6PRM_LPASS_CLK_ID_INTF9_EBIT		0x513
> +#define Q6PRM_LPASS_CLK_ID_INTF10_IBIT		0x514
> +#define Q6PRM_LPASS_CLK_ID_INTF10_EBIT		0x515
> +#define Q6PRM_LPASS_CLK_ID_INTF11_IBIT		0x516
> +#define Q6PRM_LPASS_CLK_ID_INTF11_EBIT		0x517
> +#define Q6PRM_LPASS_CLK_ID_INTF12_IBIT		0x518
> +#define Q6PRM_LPASS_CLK_ID_INTF12_EBIT		0x519
> +#define Q6PRM_LPASS_CLK_ID_VA_INTF0_IBIT		0x550
> +#define Q6PRM_LPASS_CLK_ID_VA_INTF0_EBIT		0x551
> +
>  #define Q6PRM_LPASS_CLK_SRC_INTERNAL	1
>  #define Q6PRM_LPASS_CLK_ROOT_DEFAULT	0
>  #define Q6PRM_HW_CORE_ID_LPASS		1


