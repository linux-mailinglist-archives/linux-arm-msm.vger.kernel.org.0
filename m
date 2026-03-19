Return-Path: <linux-arm-msm+bounces-98701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IA5oKEDMu2leoQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:13:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BAD2C94D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:13:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F23F301703E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF2B3BBA04;
	Thu, 19 Mar 2026 10:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hcTKvR+0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dsw3a6vX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38E9379999
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773914979; cv=none; b=rbuZvPIavR4TTnCsO7Ss6UoEqSiFPlmSnqOvSoK1OSKXzp3hDfvnzcHaVcgSmRxssL4b9dMLD46eAnLhj3LfWYLS3aUJwl5ZAa2Tw97E5zPoBBWIJ1KNhws5+S6R4j4C6jlrk/hyjpLjTJT57JyqQ9Q8B96r5WRN8V3ftkr5eyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773914979; c=relaxed/simple;
	bh=pUS8KrWp/+SVlBZUCrdm75RxAa0Q8LjZVfSG4rhlrN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vGib17GDmaFFCHcf3zHNmuwyQ7wAcBpnnE+XOTigvS8LgkAuGSGGJlh/olmKw+kH9tqbmUXhCCP5FJQwIpD7YpT/vVyrecyjMSIlsopnf9IfE4R7iRGusPqbnmp9w4QL8/BuApiDAoUWN3kDwbldlo8lrToxM3SS39UxGBiQThA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hcTKvR+0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dsw3a6vX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73wsF3368474
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N8mxSfzXNyJfRBoaEQdvz7W4Ia4Ks0F5EAbj13/rqrk=; b=hcTKvR+0CZSQmyRH
	E5MJdOoMORZkt8RutJZE9N3EduJrPpl9OgX1etw5ZQk/WQijVcRYv5QPM++nNaja
	lGnrh32GYZRFt8Fh5h9T3mZfabO0DB4ahegsnRE9ptkh0nJGOPQRTHDckCU1dBsq
	nwk5RuuErkoixgJ9h/WikNvamxST4pIhZcpRxtNfUyIRcdketVqM2K6e4qAKsr8x
	tnozskWT9bsS8fNuHhppJgo/djWubalN55/voA73pqeehqNqVBHHnhXG1p9qMASl
	4a9BPmFeZVEd7CW5myQjRmXB1PECK5h7LCPYj2wgj2jDMMGc/2FjzYdX6r0VSpEv
	p8cIUg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00f9jr44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 10:09:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b2a1f123fso3301121cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 03:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773914976; x=1774519776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N8mxSfzXNyJfRBoaEQdvz7W4Ia4Ks0F5EAbj13/rqrk=;
        b=Dsw3a6vXcJnJRnLmAyyGO364LoUXP64YCgmYuECL8f3PB/Edf2BY6CX/k4NUUUy+4J
         QVBw9LY6TxB9iBqPs/7B1GOrcoDdqE2H79y1Y2eM9/IIjwxxJcRAs6ZIIxMowq6M6Q0J
         i3U892bSiLHm38FmaNbY8eg0bs+F/gkagWE/BQ8bp5S85Fn7/UtAb39KhS+3GGhONZRF
         GLQd8ndgH080rxYjrcl8HRlMqIbL+T8MGOs2KxFluMWhO6h03Z7uwIAZej7UNPuMZlRS
         EoxSvfcKsI4trjhhl8k1PrRLmg2xkIDciyCzHVQBXU9NCS7fTGFoXqA/RuH96oSL9dxA
         Hycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773914976; x=1774519776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8mxSfzXNyJfRBoaEQdvz7W4Ia4Ks0F5EAbj13/rqrk=;
        b=Ol1TLrO+bzbyGc9IzFS4MuBjgOG3/aviS2eHdxUTxzcbJg5lTuKr5lqnDErcCioosx
         gZTifh7SRJ9GvL435T97X55gSyMjf41YvxuEJ3llsxCf4jOsJeM5M26AKUeVIY1riyOv
         bAeAGehBojA8R/5bfhlP7Kp6RAf7WfLHQRP/WSHaMIaJHdTHfz3JEIRvvRjKT1iI+mem
         1i4q663caV2gN7MJR8c43Kang5lI6fd3uZFDG5ZrTAiYK6mW2dw730z+4LTfggh++Bnm
         rB6WI+tAlLhuvhQx6DngsGs78obTHWhPm2QL8Eq31zd1P0lOlAOv/3q9Dvq/MSH9eUWk
         FjRA==
X-Forwarded-Encrypted: i=1; AJvYcCUWcgzh3Y4tcE73kqOIL/6h1sMW1pGey66qEeG/vuoT1qMyfMwbOXybDyIqNZ7blc5vGZu6OIYmNCVdWads@vger.kernel.org
X-Gm-Message-State: AOJu0YwiH3+fqAy3irHfSm53bUeAN4meBOf8rzhdLQ7ULF+409DPlE2C
	GW3cO3ewSudqvxbKy8pRK37ELIfutn2y7NhpiGCbKAFGVsnrH8C8q6Te+MjWJOgFEQnTORPV9Iv
	3Yxo4+nYstZuTIEVlCz0z2qXIoxmXbZpipUuoqVzkVQQ/9k97TKmFS5RsD3HcIEOH4z5sc/YbHc
	wT
X-Gm-Gg: ATEYQzwsMdJlsznGpIXwWO1+pDDJR4tQXV2AvomTYUsJhzzO8ykZRIocqfRds18Qj7d
	KwQJr8RmJvdilLk0FD1pWjt9rXq+tTDChQRY6pBZOjJm4ttDiuW3UJbDOo3bqjrUM1LLdnuBrln
	Esnf8FpageXllnatwvXcmZQ4sfvoPIt5mTzDAPYUwhZd0n/2qvE+teu2zX01z9PHqb/q8h33L+Q
	cCWqLWzRBPGBihXMN6mPktowS7hQGqVDq+SYam3GdG+96eHsLSDLBU2MU7if3bjbmJjgpFlLH/w
	NV0egAFXntJ/ei4xulbWVqzIp2NJhbI/xDvf4iDVGrJccL87OsNVTIPxkpr6oNL/dYH8Bl+LrhO
	k5JGeZoJIhTgLyW3W5LAYz1kHklxLvlzij3EH6ZYuhFgbdvBJI+LjfQe6O8Yziwu1X2cRMiECIA
	BGb7U=
X-Received: by 2002:ac8:59c1:0:b0:509:38b0:c44b with SMTP id d75a77b69052e-50b14866da5mr65080881cf.5.1773914976672;
        Thu, 19 Mar 2026 03:09:36 -0700 (PDT)
X-Received: by 2002:ac8:59c1:0:b0:509:38b0:c44b with SMTP id d75a77b69052e-50b14866da5mr65080601cf.5.1773914976161;
        Thu, 19 Mar 2026 03:09:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6688b67aacesm190582a12.11.2026.03.19.03.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 03:09:35 -0700 (PDT)
Message-ID: <7566c66b-2dda-4b29-b59e-4e4a7e159e21@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 11:09:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/8] net: stmmac: improve PCS support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
 <abdEscs44fU4kRag@oss.qualcomm.com> <abdYu864OmNWiWIW@shell.armlinux.org.uk>
 <ablpxwGks9m38fhM@shell.armlinux.org.uk> <absjNQ2s3Z5N2Zwo@oss.qualcomm.com>
 <abtE7sDT75I7uPnk@shell.armlinux.org.uk>
 <abvAuHFZzCFobO-V@shell.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <abvAuHFZzCFobO-V@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA4MCBTYWx0ZWRfX0rGFpZY/7MOI
 K4WucdJHQaPvWS9dJ0tIUwgDwzNV77fhWqfGJyUW4vVQsCakGSDwNhz8bbxTCEQg4xLq1+HkxjW
 knrdHdIwzFCEBIECerOheSDANfcRoVR8VNIxnx1O5MJ0L5qqsn9TSkbj1YgFyjs93mMFuQ1YUvW
 kiA2Ie5oMR36BstXDTOxZSAEH2AzGRU7XdQS6Zou+k3aAjoxhIi0kE5vJ1BNlu9ShzrIYcJqUAq
 svUdExq5vJ+lg+ePlm+jLTGSckJckVdZfYDMGMf/4PWVzcx40Y+I/uW62P6TqWD67rEXXdXrrSr
 B6eocZ6SyP52qk7tRtI67qbLkqj7Kq3G/zeIEPI2Nz0eilRidBmU//b74Uiirw5z3eRF0smS9iN
 KCc+AcC6QNDeAYmx5ScHzK1rem6/ifzAfy66qP/CRei6L5TDRgHShefdvGeP85MK3/PwwgLaOOJ
 4ImEpQIhY25I2ye+xFw==
X-Proofpoint-GUID: Rxp0Rh8md9egGxmVBSwWO3DDz70bt-tU
X-Proofpoint-ORIG-GUID: Rxp0Rh8md9egGxmVBSwWO3DDz70bt-tU
X-Authority-Analysis: v=2.4 cv=MJttWcZl c=1 sm=1 tr=0 ts=69bbcb61 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Gtcge7hCmZdjPOC0CCEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190080
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98701-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E2BAD2C94D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 10:24 AM, Russell King (Oracle) wrote:
> On Thu, Mar 19, 2026 at 12:35:58AM +0000, Russell King (Oracle) wrote:
>> On Thu, Mar 19, 2026 at 03:42:05AM +0530, Mohd Ayaan Anwar wrote:
>>> [    8.650486] qcom-ethqos 23040000.ethernet: clk_csr value out of range (0xffffff00 exceeds mask 0x00000f00), truncating
>>
>> Please look into this first - with the MDIO bus operating at
>> who-knows-what frequency, this could make reading from the PHY
>> unreliable.
> 
> My guess is clk_get_rate(priv->plat->stmmac_clk) is returning zero,
> which means we don't know the rate of the CSR clock.
> 
> From what I can see in drivers/clk/qcom/gcc-qcs404.c and
> drivers/clk/qcom/gcc-sdx55.c, this looks like this case - the
> struct clk_branch makes no mention of any clock rate, nor does it
> have any parent. From what I can see, neither of these drivers
> specify any rates for any of their clocks, which likely means that
> clk_get_rate() will be zero for all of them.
> 
> Sadly, when I designed the clk API, I didn't think that people would
> be stupid enough not to implement the API properly, more fool me.
> 
> Under the old code, we would've used STMMAC_CSR_20_35M, which means
> we're assuming that the CSR clock is between 20 and 35MHz, even
> though the value is zero. Is that the case? If it's higher than
> 35MHz, then you've been operating the MDIO bus out of IEEE 802.3
> specification, which can make PHY access unrealible.
> 
> In any case, please fix your clock drivers.

I'm not 100% sure the currently-passed AXI clock is what we want
there and the docs aren't super helpful.. is there a synopsys-name
for it? What rates would you expect it to run at?

Konrad

