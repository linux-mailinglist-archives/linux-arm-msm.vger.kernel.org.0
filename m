Return-Path: <linux-arm-msm+bounces-93137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +POwJgJWlGm8CwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:50:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D29214B931
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72A0C30276B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB10D335541;
	Tue, 17 Feb 2026 11:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EgyJuyKy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MbdcrILY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117DA32B9B4
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329011; cv=none; b=N+cF44PMgAUDjP2e9VgvgB3+j+J7El6YlJWIUWIXXDxSNojZzevlhX7l3C43KKzqHNkswWZ3mh8LimsfvUNX7zu1JMbTOlbg0eiE3CLADYGiQvRBjdtJC6Dd5Of72So79SPg9WffSOrAStXR/J/k4KfJjewwethAxhPApi9B2jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329011; c=relaxed/simple;
	bh=NCjtlNucLfyp5zlzwXlpdQiVGY+9jr79qHBlVQW93/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WLuCBLf+M5VOyM7JE4fmY55fiUeTWHTr2F4Lr7G5thv+N7NjtpYB12FFRSE5cWpyDk+J8yP9h5f/P0lZOKZ1C5UJTghRxYARKhbWUnmn2UEcuz2r8L975EFj4lr4bkFuMum8THeuFW5RsyZFhCRC8WIG6VVl0kZSxuG203Vjgec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EgyJuyKy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MbdcrILY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H9x8aU2801723
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wga4hiWjY8cKz3LP1L4qE8mRvDcvLKscrPkdZN0JmLI=; b=EgyJuyKy+UlE7kLu
	TcgkWiHq47DyOvjI2TerhEFxSuWeArTwIs3/leFfEvADxMWNKmNT5oQqKq8f9sHt
	8kwUJJmInYuOAuDn2uT2ciQOI/zk97oPDMkYtapVL/tOlZkeRJzNAk385vY+W/Tt
	3uJZM13hpN1ulBcMxO5EE9AAvP9pqHt/OKqnADTE0Vu5flCvkE7qCkc81sCyRzKZ
	2FWRBqmKokFVUL1wQ+9geB2jDqLO/aVOA3Ka+IuWqbFm3mLjx1ChX57f0FqIcXx4
	+24nDsGxMQZZxU1eH99Hb64l3ClxLjYtTG5Q3NIqhxHTBeVUCGqK5udomOpKB/lM
	grh/sw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxuk9e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:50:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8954ab64c65so42437816d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 03:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329007; x=1771933807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wga4hiWjY8cKz3LP1L4qE8mRvDcvLKscrPkdZN0JmLI=;
        b=MbdcrILYi6DqL5tU67ImhHUmdU4ZYzGu2O5ATubPxmz1Nh5tF8OMeoHlU0ljn4f6ew
         rMfmBnsogWeVdxplL9LAWuRvkBaJuMIIOjE4tyRIK0jBOSXc7ycl5cUcs3PJ4QxfqYEB
         2FsycpcebM0SOxqVOGbAVAUtaK6bEWXQhnBVNE76ooVV/PROOwfuqQHEkwBZIQ5Wd1/1
         S9O88P3nt7C3f/ohBjDN035lajLd/mLiUWhKSorTDll/QKcaQu4Y01E+qBs7n0VvN1zb
         2PSwb9bw5PIFGPTOA21ux8uIiHyCSElFk9asIZRSRBIhcFtAiRy9BU98ND2+MYn/pYTm
         J14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329007; x=1771933807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wga4hiWjY8cKz3LP1L4qE8mRvDcvLKscrPkdZN0JmLI=;
        b=bpKFFbdJV3ZxOWfDhYLoNThU7rz1sNH2faW9u4I57LRKcuOkiQHsKBPV06FKzH371G
         vEiOl5QOdrE2WvlOQ5ILEKfnpZHCiPwXLkhyfrCf7Z0+QOWN6FNXrAdXkib1WWDIB4Qj
         umDVuSddRcN7ieuo4tFhNMkfe3WVNsg3ulh0DowVfW8QIpGPevx7jVsWyVtbWC/49RLv
         Kba6aCgjiUvGUK9YKdEASaRgObM7kizClRHx1LjrrqZyfVQ2WheNj2Dhy8vouiI/S6sg
         73X3tbAv7y88CtDSH7O1CVcbTPDiNTFcQasLDENVMP6WFxOzX2CgYDGkJKcF0l4qhnBd
         o31Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZemD0PDA139qteEUeAzn0YiXh2At3aPPhypyFLr507eAYeXWZwhzn6MtEc8OMNOuw9XyFvHo2f3IGFW4m@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi0XbgTDo+5fm/Glgp2e/GPY9KLeTajTTBCQZPtVBHG294Z2VS
	flWV+blLfsQ+GFt4VvqqjEmHo7x0rVfzPQgwLLhVW7VuQ64+5dgPttFUL8M/VdAXHJCDGDBNIq4
	Zpa7HR3WdR31EisL5dSTKz1gIomN1GY285qHJnsxawC/WmMt6CeZTcbMIYl3pBJXmz1dv
X-Gm-Gg: AZuq6aI17MFy2DCR9xJ+X+bDIybtZjPWcxVSXgJhX/OmZIXVOosAUHG+PuX3wVBzxDX
	zoxbqYD1Ytv9LjLUcil54rMzoKbmF5GXofWDxOYrXhtMdvpLhO1loVjtBL5dWc0G1UkW/+neveY
	RMxfpUniK96oaFtxh+ZDK3QrQMShNgYMkIC/MoZkHZms+uzIjrg8+I4bqX3K1Uy7WWBF5ncfhhh
	K1S5O72aDh1abSsbUhgeVBI1RlgZHV/Qbvxk5y4QWNCE85VSn51XhxhMDTRJZgpBVEJRDeTKtgf
	092TOzGVEwev4k5wYa2JyAMkhnoYT+bUPe29rpeMzifjtUxV9ocQ48qYJaFuDz5mMcl70pqP8oE
	bhi0cvxTNXmbDVR8ViRaI65LRbRZ3WSe00SRHVSH6kznY2Z+V5P+x6aj1WkPayGQL92iy9QYBoV
	EAe8U=
X-Received: by 2002:a05:6214:8008:b0:894:de0a:4cf1 with SMTP id 6a1803df08f44-89734819033mr138987126d6.8.1771329007416;
        Tue, 17 Feb 2026 03:50:07 -0800 (PST)
X-Received: by 2002:a05:6214:8008:b0:894:de0a:4cf1 with SMTP id 6a1803df08f44-89734819033mr138986866d6.8.1771329007004;
        Tue, 17 Feb 2026 03:50:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc76655absm333837566b.51.2026.02.17.03.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 03:50:06 -0800 (PST)
Message-ID: <389dc762-bd20-44e5-a3fc-256b42f3c82a@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 12:50:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/13] i2c: qcom-geni: Enable I2C on SA8255p Qualcomm
 platforms
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, chiluka.harish@oss.qualcomm.com
References: <20260206174112.4149893-1-praveen.talari@oss.qualcomm.com>
 <20260206174112.4149893-14-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260206174112.4149893-14-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5uezERStJ2jxYave28UiZ3Aktr_Xnf3n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OCBTYWx0ZWRfX6k+M1JyII69g
 +zr2jEaH4kVYoRYuSiDBS9i7Yxo+dVbNhQvw5d20AaOfhYx9vjCMo+Q9VqB2l70smPIAz2zoYbH
 y+lTFQ+Q3pjVVlpfh17eFDAj0S1VqlSvWO32gyxa5oKqGJGx0WryOrAvgmaWw3cVRyhq6W9HxB7
 THkwHR8H5eoSnU1UDFn9LV7YX/2m+t2bd2Ok4GQXAchUIqlFirrfR9bdYIKl+J+rDAaKwStNSda
 KlrhEcxuKsx02LCaMN6TdTOqeIyDEUg5nPa/V8P7bjlq2g4AED33Zmyq8TyfCtB9zrjc0iM8r7a
 Wf1TXICw0CXJT5p/5HQLODKVdOBAizwS9JvdEhyKSFej05jz9T0yZ8zN2nGrnLNqIwfyqWx/kLE
 FBHxN/U4ar3AAIMx4eBJK0ioGTfAnTIKy13/6OYIYNB2VpjMTFruuWHBG3X0ob/lPZkRrYKlDSV
 v6naDgGRp0fEqJ9Kg7w==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=699455f0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=uvtuXJDLjHB1kenEHasA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 5uezERStJ2jxYave28UiZ3Aktr_Xnf3n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93137-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0D29214B931
X-Rspamd-Action: no action

On 2/6/26 6:41 PM, Praveen Talari wrote:
> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM.
> The driver requests resources operations over SCMI using power
> and performance protocols.
> 
> The SCMI power protocol enables or disables resources like clocks,
> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> such as resume/suspend, to control power on/off.
> 
> The SCMI performance protocol manages I2C frequency, with each
> frequency rate represented by a performance level. The driver uses
> geni_se_set_perf_opp() API to request the desired frequency rate..
> 
> As part of geni_se_set_perf_opp(), the OPP for the requested frequency
> is obtained using dev_pm_opp_find_freq_floor() and the performance
> level is set using dev_pm_opp_set_opp().
> 
> Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

[...]

> @@ -215,6 +220,7 @@ static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
>  	val |= itr->t_low_cnt << LOW_COUNTER_SHFT;
>  	val |= itr->t_cycle_cnt;
>  	writel_relaxed(val, gi2c->se.base + SE_I2C_SCL_COUNTERS);
> +	return 0;

ultra nit: a \n before return statements is preferred

[...]

>  static const struct geni_i2c_desc i2c_master_hub = {
>  	.no_dma_support = true,
>  	.tx_fifo_depth = 16,
> +	.resources_init = geni_i2c_resources_init,
> +	.set_rate = qcom_geni_i2c_conf,
> +	.power_on = geni_se_resources_activate,
> +	.power_off = geni_se_resources_deactivate,
> +};
> +
> +static const struct geni_i2c_desc sa8255p_geni_i2c = {
> +	.resources_init = geni_se_domain_attach,
> +	.set_rate = geni_se_set_perf_opp,

I noticed that because this lacks .power_on/off, the
pinctrl_pm_select_xxx_state() functions are never called. Are the GPIOs
managed through the power/perf domains of the QUP devices too? (I would
assume not since there's a TLMM node in [0])

Konrad

[0] https://lore.kernel.org/linux-arm-msm/20250422231249.871995-1-quic_djaggi@quicinc.com/

