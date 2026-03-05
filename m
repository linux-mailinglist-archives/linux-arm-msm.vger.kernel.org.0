Return-Path: <linux-arm-msm+bounces-95542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFv+LFNBqWkZ3gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:39:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5871720D8F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:39:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B77B4301FB87
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 08:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B1137419B;
	Thu,  5 Mar 2026 08:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zhs1szgR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jftXYqSq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D58374183
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 08:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772699983; cv=none; b=e7B8PhbFJL4xR9Uw1wJCfBUf6vgbN/AxVP7CULOZpI/XfGDaKNzrVgtpufydnCq26C8zMMIA/NX2MmhZvtgq03je7jMupr7YE47sfxTJv+0VEMLl475Yipr2EEUk7fPOW+f65YEvZy4j6KZKT8R2BWTuko/MkVZnx8ltbhQyHSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772699983; c=relaxed/simple;
	bh=6xaS693NEPvMsmPDTvB8J6q5UsLGM4wm4qipY7xfOGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cgTe0q7m7j1NKTtYNv139E66TgtaQLNyzLwI9EWXMHh2i5HZdkNqFBlpffJraGOur7YSh4NPQRfTikfPvWH32TQv/zeoihfDPPODDJrfiZG6/btGPrNkNkrqkz8gGd/0k5FZcdnAjuyWiuWvd1v9QAz4bQiJZnNdF7OXpFi3NnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zhs1szgR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jftXYqSq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251BZo52665149
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 08:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=; b=Zhs1szgRs6PvG6yC
	/K6l0Og7co3C6ED8icQT7ngtsI9G5Zp17IaIYa/MOFJSyTxAUHo39qtMLOBGQhpj
	JO9fE/F/E4F4LvhAKnAlFKn+fH9sEpkGqfNT9M43WTCJkjqaFeUzfOGpTrDAGNtC
	tA5poP4iW9oFEFa2er9A5XyBDJ8CedmbmCYM1jjJmOXgrD4UqsM96/EbUTiVA/x+
	+Hq4ib0d4uJFejDRNFTAYPM9OxAzG41cfjw0IJBJVDWkmbFbGS1eLwFkvUDxUI+x
	i9yGzbk3U3z2KxBfUGbK5GoyOmpZPSUHhrYGJ9ek999ywA1Q/YTR3XTo5MWWFrPw
	1lqwYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuhb1yat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 08:39:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb50fb0abdso615772785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 00:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772699980; x=1773304780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=;
        b=jftXYqSqtrokdujho1rSZ8RV2+df0VSJJ/M8ZUZxSfL+guycXk5e5Oa+/kyiYv6qq7
         wDt7pgwE82GoCanbnE56n+QEoFdpyD0IDJAXa2uedcbQvZQWJRRzpQWeE+FA2evLbImb
         HHx25k81XwtVs8AYIfGmGN1Heris1W4EH+3TjG9IsAQO2tfFNcYJFHacx8H5ixGQjhjp
         YhLkHjONVRBKpyl+EoAHQo2i8UAnKVr+iozz53JeeF4uhO8r6lRrGpcB/0Hhik80AyD3
         +bPbUwPZDvHgZwinc1JyJ5+XebVWXjYBrsXBjFQwXL48HKIXO1qH/SWx+i+izxWR3tKA
         fXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699980; x=1773304780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=;
        b=Lom1Cp6BkLH+411rvcGSTzlEIDslrtCy4IkCldFxp/vqHnq43GnD5CBT/wei2BNs+E
         InMw7imzhE5Ss/+eoxPZQlYqiBoBnxrYK9MuXhqNOxskLYwSMiLEbeeZEnaEG0tImad8
         RL3nPE9x9q+YRJqbACtKCOgN4i9L4gsC2qpX0e4J2iTHIjhz00fJL9zJxhux/j4dhxvC
         MpaLQQwsfkgW1OEnqsIYCcNoHA85PxW0pAjcWKkb14hLdBOvoxg5BBKKWA2keO4UyNhO
         OrKsKRv8t/JHiMyNg4EwJIG0WZmPX6EfiwEh0J1Y8DN2/BtZ4qU7hMVFhH8l4gFhhyLM
         zK6g==
X-Forwarded-Encrypted: i=1; AJvYcCVFmmJ/NDMM1ZTjBZxSehqCFYsnqiVhshGIcqfKPywwGf02fPCFQRdkuryrZfDJI0gYnX+sNiYDzCvFUY9C@vger.kernel.org
X-Gm-Message-State: AOJu0YysVd6SKr50R+BnLKX78iNTZUVs5y6u2Wir/sEtvdHqb5ZoKsnb
	OIr6e5q/pV1F0lUNQSk8dIBFQA3Tfgf8er34N7VfkgsDLwIIGxcF0oHFl3WJiYVKcH/ix6Xvsv8
	Qg6qt5jrd0WtZaEqunLSwTQlIPimqpA8BvD2Eqc8u93vVnLLWchiPqwrWsFIeuWIxcoyv
X-Gm-Gg: ATEYQzzKuBwYgt0zskDZ7uwlVulTRA0b36KcB6CL7D5o8NKbMsis7zmSTRs9apjMSUe
	P4sdQ1+SAB87u8Cv1jj6d8Bs7BhhTXhVJ1rX0dcHJ6JPHxxA4V14QfWZUkc7DE7HpjNIXKmL7UJ
	bNrhStsjQpBzivtX3yg2Nr0Ug0dNREryzENUGU0iT8PocT4G1guhiuU84hobtDxXCMu/JaabJ6j
	pKSn0tmCkmIUgdomvhC/pOtuGxSs2ZB3LJGgxAGKDNYnKte1get+318jrv8BZ1M/zHWK5umE2p+
	Yrn/3d7tBMSS47i8ysZB2YtU2Prp2NqrTAcr6RVhNOXFACqRpd0gFrkAJpyGD/WvRVjmMBoKy29
	QadUwlsOzyOpUmbwdtdUJrSs5olK6sXQOH8UmXlvwio8rC9T+mYggpu0CwaBd5aeny6d4ulxoc+
	UbE5s=
X-Received: by 2002:a05:620a:404c:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cd5afcdcfbmr452358685a.9.1772699980144;
        Thu, 05 Mar 2026 00:39:40 -0800 (PST)
X-Received: by 2002:a05:620a:404c:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cd5afcdcfbmr452356985a.9.1772699979710;
        Thu, 05 Mar 2026 00:39:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fac06e3fasm6657504a12.25.2026.03.05.00.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:39:38 -0800 (PST)
Message-ID: <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 09:39:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
To: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260304175735.2660419-23-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA2OCBTYWx0ZWRfX/1zhPGUloLZZ
 6HWNBaTu53DtUM4AqNin+hSnsATtSQ1bgQApUn8ICbMm6NvTjSs4oHp+R89yz3aSSbK6txhmq97
 6Y+e28BSCDws87+mcTYsKqv9hqX6JDQry32Avbrd40A97BZETi9rkVzKrQyJOnmxJJtl0BQUvez
 VastvSq2ekdJjwTZxCC15CwHPBH3iZnnCdWbPuEj8r0Stfb+O7Rgt4W1XPMaHvSybPfPLk//CFz
 i/TtsKKm3kpfAOUI/0JKmmWj7ho0O/X0txn/wmTweyOZBMLA/7/RWPdJNP/VB2CmBmUvqs6E15z
 Iavk3Nw27LNO2izcXCBGU/izQD8M8zHNXQTdWrK8kEc/vFXgze3YjLwEUG6zRtvCwABbcNNP9Kz
 VM3kMp9IgFuZeuPlYCctqXU72Psery+LOSf+xRwPBrjJflYcXA41WDLOix5JKNckCoF4CS/9Rzc
 Ma7kcYtcKyMqZjrb7+A==
X-Proofpoint-GUID: BrYn_mHwGZfImbgchy5ky_ao0r9wUbIG
X-Authority-Analysis: v=2.4 cv=SqydKfO0 c=1 sm=1 tr=0 ts=69a9414d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=8AirrxEcAAAA:8 a=GJStlgXwfe-SXQdWLvAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: BrYn_mHwGZfImbgchy5ky_ao0r9wUbIG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050068
X-Rspamd-Queue-Id: 5871720D8F9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-95542-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,nxp.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/4/26 6:57 PM, Vladimir Oltean wrote:
> Some pragmatic shortcuts are being taken by PHY consumer driver authors,
> which put a burden on the framework. A lot of these can be caught during
> review.
> 
> Make sure the linux-phy list is copied on as many keywords that a regex
> can reasonably catch.
> 
> For simplicity sake this is not perfect (devm_ and of_ are not valid
> prefixes for all function names), but I tried to pay attention on
> avoiding false matches on things like:
> - drivers/net/vendor/device/phy.h
> - include/linux/phy.h - network PHY, not generic PHY
> 
> So I used \b to try to match on actual word boundaries and be explicit
> about what is matched on.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55af015174a5..bdfa47d9c774 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10713,6 +10713,7 @@ F:	Documentation/devicetree/bindings/phy/
>  F:	drivers/phy/
>  F:	include/dt-bindings/phy/
>  F:	include/linux/phy/
> +K:	\b(devm_)?(of_)?phy_(create|destroy|init|exit|reset|power_(on|off)|configure|validate|calibrate|(get|set)_(mode|media|speed|bus_width|drvdata)|get_max_link_rate|pm_runtime_(get|put)|notify_(connect|disconnect|state)|get|put|optional_get|provider_(un)?register|simple_xlate|(create|remove)_lookup)\b|(struct\s+)?phy(_ops|_attrs|_lookup|_provider)?\b|linux/phy/phy\.h|phy-props\.h|phy-provider\.h

Would looking for the devm/of_phy_ prefix followed by an open parentheses
not suffice for the 'has function call' case, instead of listing all
currently present exported functions?

My worry is that this approach is overbuilt and absolutely no one will
remember to update it

Konrad

