Return-Path: <linux-arm-msm+bounces-109650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KF5ADJdAFGo3LQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:29:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C32205CA7EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2EF333001309
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A092D94B5;
	Mon, 25 May 2026 12:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Am+uQnFz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZGJ0Dtm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F683009D4
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779712149; cv=none; b=cfEkRpcViRN6zRD7h+eXsNATZzADyT0JEWXojy1BrOU+YqBKFh6gUNAhsb6FVmeQhZV8hzitxQd6SYbDsHVU6/23Jewzk+QusKjOw9iqDtO2leJvA+3kFJu/TdYP9YHOLiJkHVu6AwjSZvSadOI+5KA/2L0EYxEC5Pl8ejzVGeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779712149; c=relaxed/simple;
	bh=bJam9d9wgB1Gn2ocppTVU+blL4ywYWSzJ5jYeRngki0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dgkx8Qcj3nFWIOyAwIAJ/hxKPHTQCfifLlaqz2UCIfiW92IrGpn8qnN+ITROVOVLpSyvkWmiiz6puarnHODQg+YE6z0EZf+/kWUj+8oUEeMu4NVelolJGcxV7/tbyEQcgjfhUQ14CU4p2nMs7ZNCuJAwBZjOOL+GlAKZ90kRUNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Am+uQnFz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZGJ0Dtm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6YKu12770816
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LVcfpp7gDg3CEL3Q/5mwWyOqC+o1OugfM7GNZUcI9AY=; b=Am+uQnFzsmLVdXDP
	CGYlwOTyMNPPFP9L0d3xidEQHlE2Ya+qHaBlQX4ht4c9e/Gj7ML6gPIanHhdHJdx
	eJ6/mUL3Im37LYRnT0XSxbN3M6Zt+lBfazlxakWP6B7NbBAUIwInTD6ZpQK3ZJGY
	3xRSlbDka/eQ9l49OgVsKNf7TOhDk8y0DHrUCLHSY6TbBGEvmP6ONLQUO5lqDZtC
	bZzuxfB2PdTydluIpCVa3QEuRpBqmq7k4ngqbZWY67hUGkq4V9XoHNQPYQKASW+R
	DIWSsqEI9S/kRgshy70AxBuqUow0GU8tWMLpUiK6iIB3jNVwVgFP//gFJs9sZZER
	xBSSIA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb36t6sjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:29:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fb0b93e90so25569221cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 05:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779712146; x=1780316946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LVcfpp7gDg3CEL3Q/5mwWyOqC+o1OugfM7GNZUcI9AY=;
        b=MZGJ0Dtmu5xqiIITOHAip81gCovCJLE+4zAxj/F1ttKqFRzz43WoWHZl5J8woRdeNQ
         s/zrqMChujw8ibpl44ZlQdF+BXw4jd5x9STfIXnboV+nX9BwGCXNneZ+72cdD/Wn7fn3
         Wdho+NdeZ+M2fKLfrr6erAQ7iM2zxonVLsMRdioJMhgTG4MAJwiu5ROsTtl0IaKSuvip
         2gPEqNbJboUa+fKuKMVD9Xi1IFW/S1DyOrNDejEfe7PDzWqkeKYloXIMd08XygBQafB4
         a9CUKw0Y8DEGTlyZ4C55kgu7yjTnay7Ne0ikBtgxw1a0i3R58Ct+Tud+S8QjNulYOuH6
         jm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779712146; x=1780316946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVcfpp7gDg3CEL3Q/5mwWyOqC+o1OugfM7GNZUcI9AY=;
        b=Kf5HLebtYyFXswzK8oSweOF3oESrkzDrp42evc/Yhot6L5UhhdDCHpKSUwcLWG2kP9
         m6YEWQYrfXXbWzRUDafp8aMWjnoulAU1kP3pxI/Tqaf4Du385MypUZUkJ/bza0g6PMzX
         twe/fnd/rpuEW7XeN3bsNuiwgUgYsRw/+ijk7sBiqQHsGQPJ/BbKR57js49Dlai79dNc
         7yl3W1a4VovshVrUUEDQCKHGgzrxaRfE1FYsFcu1OiQ7Deu76fqx6/UnCXfn7d7bJAs2
         C9W/IyShViwPTkQi+sgq6clBsCRh9eqTkD+ZuOeQE4swSSe5JVUVSm9Sk6hG4UeuALs9
         405A==
X-Forwarded-Encrypted: i=1; AFNElJ/pjLEIEdseJ7/Vi2zEKYfWdpYuZvi68Fte5Juh9GlFj3jKVUIXtnFLvi+L41CJ7BZTz+KYlWPYn1pvRNUk@vger.kernel.org
X-Gm-Message-State: AOJu0YwNRQxMn7AA4RGO0Tuh77IeOmpFV7zxrfBrBcxiNerZ2hX2O4lr
	+PIG5GN/O0HW/1q9JspBDIE+Na5ktZJ+vpnw4VwdO55m5ELqzeEf6IbcHZOiflFmWXGOpxrHIUZ
	kMGehHP83Yjz7PSMWHreiO+QYh0AIERYcZKAhg6WVhjFXLeOfBOUaVmpRe79J4k0DxtkwOmtDCj
	uF
X-Gm-Gg: Acq92OHW7SXrWV2q69tmZeitcKlbAgRdwaYERuwOy28fv5BHCyvwIP5/Hjwz9W+01LK
	9Pzfdxh8ePh1wQ8S6V+PmFZeC0QZ11Q9pUXZ7CDmnbJ7qfIpY2jmHxyujTvAtqCuHMOrMJYa0zB
	iYH6jhUnD9EYZii9RtjNyjDBCT5hEBSeitnsYrpeDyGrI9feRKFQSQfFHF0A7/orgkdB2Lbbp+O
	jHreH2eC+dpS8LRsAeMkZ+/pRpxpXPubpNTjSTgTiyN/TaaM4WOWuaGsKQKyPz2u3jHQj0ktG+x
	VvrDvepUfCFDzFZcdnwamWBaVlp6CRykWFzlupGDgjCjEU/XVWvtQLEs93E16gcciCqvjFiRz6d
	KhHOAP/bIdJUgrtyaHuOzpbpVLVv73PDRHax+oLjEn4N0oA==
X-Received: by 2002:a05:622a:14cd:b0:50f:bfe3:a04e with SMTP id d75a77b69052e-516d43cc357mr154594451cf.7.1779712146366;
        Mon, 25 May 2026 05:29:06 -0700 (PDT)
X-Received: by 2002:a05:622a:14cd:b0:50f:bfe3:a04e with SMTP id d75a77b69052e-516d43cc357mr154594131cf.7.1779712145909;
        Mon, 25 May 2026 05:29:05 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc62d3f21sm391655866b.44.2026.05.25.05.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 05:29:05 -0700 (PDT)
Message-ID: <7d2aedb2-4bcd-4453-80be-5c7ca6bdff95@oss.qualcomm.com>
Date: Mon, 25 May 2026 14:29:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa: Fix xbl_tmp_buffer_mem size
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260525114749.5939-1-johannes.goede@oss.qualcomm.com>
 <20260525114749.5939-2-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260525114749.5939-2-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -Jo8oGf9YXQ7N1VOW2pXs4dX35kjZic7
X-Authority-Analysis: v=2.4 cv=Fto1OWrq c=1 sm=1 tr=0 ts=6a144093 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3EQkVh1QaxhCAZB67zEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: -Jo8oGf9YXQ7N1VOW2pXs4dX35kjZic7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEyOCBTYWx0ZWRfX9TkvK1/uke7e
 WDNfLVzFFeEcOFLQGIXlfji3ypvv1XtQny04CDZtWcf8E9kdzDLf/OlqQdYedekQD4hgwpfCpnt
 1YJBkDQHxOnYgDfnezz6E9cCl+Vu/YpugZYSFbRx9CMTon1MJvlpKZ/Tbj3TN3l81W7Uk4p9Ozz
 mX5WfJmW/SsI9qMQjKGL4CWVL4LZ8qnes6p8alJH9tLu0CXvS8eum4VLAMYD9snqbqtIBdtb3Z7
 fdPhkuAuP0/zNVPHkbqqCB70GUSJDeVhbPRsOoY42M4/Axf+rs7rItfGjq7MIHR//c1+VktYsnl
 mH8gA5L8Ho3TpRhlq3E2HAj8DdM7jHIabYgN6b3kSIScacP11wd9tScuJ8pdF8zLIHRroe1Q/wo
 lGYwmiB8+hnvkabhXCOLFfBmKTdEAHdXJu3SGP7LuF7MPeQo/TaXYSZ0/bOLeq2AyPexN7FBAX/
 0oXQ982WjRM6QqJlO7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250128
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-109650-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,4.239.109.128:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_PROHIBIT(0.00)[4.237.230.224:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C32205CA7EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/25/26 1:47 PM, Hans de Goede wrote:
> The EFI memtable (shown when booting with efi=debug) shows that the
> xbl_tmp_buffer_mem region size is 0x1c0000 bytes large not 0xc00000 bytes:
> 
> efi:   0x000082800000-0x0000829bffff [Reserved    |
> efi:   0x0000829c0000-0x000083efffff [Conventional|
> 
> This fix aligns the size with the EFI reported size and makes /proc/iomem
> correctly show mem blocks matching the EFI memmap:
> 
> 82800000-829bffff : reserved
> 829c0000-83efffff : System RAM
> 
> Instead of:
> 
> 82800000-833fffff : reserved
> 83400000-83efffff : System RAM
> 
> before this change
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index de0f2346cb38..5a2e84365901 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -582,7 +582,7 @@ tz_stat_mem: tz-stat@82700000 {
>  		};
>  
>  		xbl_tmp_buffer_mem: xbl-tmp-buffer@82800000 {
> -			reg = <0x0 0x82800000 0x0 0xc00000>;
> +			reg = <0x0 0x82800000 0x0 0x1c0000>;

FWIW the reference memory map shows a contiguous block of:

0x8280_0000 -> "no reclaim XBL scratch_buffer2"
0x829c_0000 -> "reclaimable XBL scratch_buffer"
0x83f0_0000-0x8400_0000 -> "no reclaim xbl scratch_buffer1"

Konrad

