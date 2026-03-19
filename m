Return-Path: <linux-arm-msm+bounces-98763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UL49MYb/u2murAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 14:52:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2522CC379
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 14:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9D283038298
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 13:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782E82BB13;
	Thu, 19 Mar 2026 13:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IuI2TldG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UGeYPSya"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E351FF1C7
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 13:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773928236; cv=none; b=XFxxxgvm/WAW7seYhi4p57y2ZApTJ2m/lnIdJeHwQlRK3OcKkjknpohOEAFn42rADsQgmtr6Iv13Uzl4p4dKlzVH5ECHmCJNiROhNFst3nCFNtk2WFz7pTNZtpAQEM7vmgPIqkul7N9ZPxV2dnCy/2lvoxzwlqxMsoVh+kDSKSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773928236; c=relaxed/simple;
	bh=dQVdjw87sBvKPcjUeJ6Wk7DOjdeLv2QTztp2sAiPup4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ie2bTX3Gz8nnnWcea9Iy1gu9nmG9gzdJxzmgdDjrMkSXRD/Rx/eyC5hk0SQSI5r1+Wf9bWFZMdsbZRYmyXnL9YnccR22aytxqAXtIcpK1U81McPxf1Q8ZGzCffIp7U4AAwtRlaD5bKuS/nzhzCu1eGyjJdDFpIh11/SIVGD80HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IuI2TldG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UGeYPSya; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73wWA1898627
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 13:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yGnqwVoeYcW8W8OE5dLl7cCg9GnEoBMh2C6juWu7YIw=; b=IuI2TldGbTeO1qOd
	T0bsZ0Ejm+yCkLIXovag4tC8Q1EfpPq9+7qsvWduPeuvyV36vJycPA9eFUhm5uac
	eman+oQZZDmIKxadtUgNxvMVDX30gUMjkuFPwbgPbHjUyfUdAiByfKGanto/cz+I
	sKpwiggt90ElyijYFMQAT7JHsitnAEBEJGzXUOFq0vxVK06Z2eAnmMj7YqyiKOhz
	H7S18hC7MEDHuHqer12XHZWkMGLcw80UNrdRn6BgA4GsGq4KyA0dWsLVUlwpyAXQ
	+2gjnWc7r/WUtCxURQ+263VxqdNgPGpa6spJSdtfadrbGSvJk49OWUIWqAW+vR3t
	GFAkPw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyyhgbknv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 13:50:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50943e69b08so6822371cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773928233; x=1774533033; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yGnqwVoeYcW8W8OE5dLl7cCg9GnEoBMh2C6juWu7YIw=;
        b=UGeYPSyaECoEvdaJ+v4wG9LnIkWI4Vwf3HOeX6xRULdWG0hn1A0w1OEr/GIOajbbKT
         TWnzS1PVqpDS39V/4I5uJggZZjk5J2eYBJ0FcLoPAbGKjFhjXNaGpmZbGLhvRYex60pA
         dw3Cs4WmDIOEMbQ1jpOxXMxv1kuzwmegcQHwKxGtRHnFhCBFaPsU0DYeptgsqfx0Z22T
         HXsxMqqyLBJJhHDu4PePlvEBFliIR99AqbYPK9wphNmdlh/LsGYvmzAR95vq7BOHLhU6
         lQmN9yNA1ZMoqZQUZvvegb9L5d8c86OI7BMYJ70dICZYw/Xhznh8oRxQxru07vGpxoL9
         dCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773928233; x=1774533033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yGnqwVoeYcW8W8OE5dLl7cCg9GnEoBMh2C6juWu7YIw=;
        b=RFFwt4/0Cego6v4J2uIHxu//rg04VZ0/Qrf9aRQkotX/qFZ/PaAjEy22XnJxSrurYo
         9ivJxIJXZZu8LIkzdNkrmzT9HBNGTeGP0mRhHzs/o86ro9IiUMtl4PTznUEZIIKbsvsh
         IOb8ZN7tNhGRIeMwuisB7XkiMZ/3vYSUS0Ow7XnVdON7SO+tYahK/tK8r7oO55qpNvG9
         Plssi+7k/Arj8apz1JXKlwO32gdzYlHv78kYTPWwAQraVcI/BzdJQlQqG9GBGnUFjcvk
         AEdwVRKJpp2Vlj8uoFRynKp1rsi6wMSZp/0SZlxRZZzi1vTYh/gcYzD0yk93tREk+x9U
         o1KA==
X-Forwarded-Encrypted: i=1; AJvYcCXCW1vZnEmI7FtB1i0SImZg1DvMazbo8XCQglXkvA3OYz7DROwt1Tk2XA2DbCG8KVH3smRJ5DHpibYr2gbu@vger.kernel.org
X-Gm-Message-State: AOJu0YwPq+1nzDN5gPaKtOQk2xx1FA9LgwEtiMgEyRbM7yhhvyW+pQq4
	nTNYQftz12BUdy9yHfG3YBoXbVCEntSKUWXo5M+5Bxgh57E/07/w2R5punLreWfl2g/D6rgde+5
	xI88RrpU60+W6P+ZnpR3P5Bo9znLd39h273+wOOqi181PeDSG3L9DvuFWp4NmWoZPOeZB
X-Gm-Gg: ATEYQzzGgsprvc/CMEzaj2H5PNj51SPtm3FYAER4GLq+JbPWeaUF6Tn08V1Zo0VnZTN
	ew1IEiDAnWmnf7oZRBSi2M2E4ogZZAytJzVj19yXVnKCE+KaHrtbOXoG59SYZPB45tDdoaDet9e
	ZSwI9982Q5QD7hTJ503UHqr3QPJ7ph8OZJy8XqiNEJ+CXzVK+E1cAX6S3TxfgVmHxIKt77rjQTt
	WJyIs8eujPRXsPM+skq+xsRAm+xKiQ0eb9uucfPOBZZqBRwOjpmQ7WTA6GYER8wcMmGuIz/qf1Q
	yWK3mMWQ0N7ZLs5rOYO1cP0exbB0OsgPDY+0XGXxpCCx9ZFec2KUWiqGSrfaTeZvK7UE1V29s+b
	CAmnzqVfLhJdlyfX0zDVQBhP+7Rd+cS287hSJKi3je8drFrf18uzW267phpQ4JfYtclw/Zu4uua
	IQUv0=
X-Received: by 2002:ac8:5f4e:0:b0:501:4767:a6f with SMTP id d75a77b69052e-50b1478e819mr78290811cf.3.1773928233292;
        Thu, 19 Mar 2026 06:50:33 -0700 (PDT)
X-Received: by 2002:ac8:5f4e:0:b0:501:4767:a6f with SMTP id d75a77b69052e-50b1478e819mr78290561cf.3.1773928232827;
        Thu, 19 Mar 2026 06:50:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f144e53bsm462429666b.25.2026.03.19.06.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 06:50:32 -0700 (PDT)
Message-ID: <bcab38a5-e7f7-47c9-ab9c-99294e095c22@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 14:50:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/8] net: stmmac: improve PCS support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
 <abdEscs44fU4kRag@oss.qualcomm.com> <abdYu864OmNWiWIW@shell.armlinux.org.uk>
 <ablpxwGks9m38fhM@shell.armlinux.org.uk> <absjNQ2s3Z5N2Zwo@oss.qualcomm.com>
 <abtE7sDT75I7uPnk@shell.armlinux.org.uk>
 <abvAuHFZzCFobO-V@shell.armlinux.org.uk>
 <7566c66b-2dda-4b29-b59e-4e4a7e159e21@oss.qualcomm.com>
 <abvy6nZyjyxUXMuf@shell.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <abvy6nZyjyxUXMuf@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEwOSBTYWx0ZWRfXxSf08vyfP3G7
 B6YdNciy5lKniIGdBOqWMYy/v8/v0tqWVcXPXo/tdHS8/6YVXHROCWQ6e1dn82dnA96sVjbslGL
 8cMGupt3zvsE74EFYdJJ6TnXmKq/yns6JSmR+hTsGJsqyjzgw3w6ISJc8no+IZhaP29VXKOU8L7
 iUrpJqg6nWGxtE5DBoRlG/H7+58np2ONeR9MbEs08dsDHrSkbEpSJauzpf0+kSFpqlsT6T+wbKd
 DnfGKGDGlQlePdPk2/qiOK9d7UxP+Wut2XaNWbGf51m+wNhfVeE8pK2tHoMEEjpUbe2T9mgCL/L
 I6A0PCrQRyMEd5AbFpsbZEFgFKEv6Het5qb8y87DdLqT/bGtF8Dj2UJJO/mwpnGINiDMf0XHRs5
 V/KNOiDrcf8Wi+yyyMW8Q6ogdmc1sLLfILcTAkRj6vRCjMpCBYWbrhiY1AIfV/I3Tfnk6Dhe7BC
 xKVO2yMxYXF92dTTung==
X-Proofpoint-ORIG-GUID: Zw0oBeMOuxHiwHa4AuQJfyjAB9e0kzL8
X-Authority-Analysis: v=2.4 cv=IbSKmGqa c=1 sm=1 tr=0 ts=69bbff2a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=WgXOwRHnL7ZWy7TE_9QA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Zw0oBeMOuxHiwHa4AuQJfyjAB9e0kzL8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190109
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98763-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3E2522CC379
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 1:58 PM, Russell King (Oracle) wrote:
> On Thu, Mar 19, 2026 at 11:09:33AM +0100, Konrad Dybcio wrote:
>> On 3/19/26 10:24 AM, Russell King (Oracle) wrote:
>>> On Thu, Mar 19, 2026 at 12:35:58AM +0000, Russell King (Oracle) wrote:
>>>> On Thu, Mar 19, 2026 at 03:42:05AM +0530, Mohd Ayaan Anwar wrote:
>>>>> [    8.650486] qcom-ethqos 23040000.ethernet: clk_csr value out of range (0xffffff00 exceeds mask 0x00000f00), truncating
>>>>
>>>> Please look into this first - with the MDIO bus operating at
>>>> who-knows-what frequency, this could make reading from the PHY
>>>> unreliable.
>>>
>>> My guess is clk_get_rate(priv->plat->stmmac_clk) is returning zero,
>>> which means we don't know the rate of the CSR clock.
>>>
>>> From what I can see in drivers/clk/qcom/gcc-qcs404.c and
>>> drivers/clk/qcom/gcc-sdx55.c, this looks like this case - the
>>> struct clk_branch makes no mention of any clock rate, nor does it
>>> have any parent. From what I can see, neither of these drivers
>>> specify any rates for any of their clocks, which likely means that
>>> clk_get_rate() will be zero for all of them.
>>>
>>> Sadly, when I designed the clk API, I didn't think that people would
>>> be stupid enough not to implement the API properly, more fool me.
>>>
>>> Under the old code, we would've used STMMAC_CSR_20_35M, which means
>>> we're assuming that the CSR clock is between 20 and 35MHz, even
>>> though the value is zero. Is that the case? If it's higher than
>>> 35MHz, then you've been operating the MDIO bus out of IEEE 802.3
>>> specification, which can make PHY access unrealible.
>>>
>>> In any case, please fix your clock drivers.
>>
>> I'm not 100% sure the currently-passed AXI clock is what we want
>> there and the docs aren't super helpful.. is there a synopsys-name
>> for it? What rates would you expect it to run at?
> 
> There is no easy answer to that - it depends on the bus interfaces
> and whether the CSR (register) clock is separate.
> 
> The likely possible names are hclk_i (for AHB master), aclk_i (for
> AXI master), or clk_csr_i.
> 
> It does state that the CSR clock should have a minimum frequency of
> 25MHz to allow all statistics to be properly collected.
> 
> The rate of the CSR clock needs to be known, as selecting the divider
> for generating MDC within IEEE 802.3 specifications is rather
> fundamental. You may find something there which hints at what rate
> the dwmac's CSR clock runs at.

If it's either AXI or AHB, in both cases their direct parent is controlled
by an entity external to Linux and their rates may change at runtime,
based on aggregated needs of the bus. They're defined as levels/corners
(abstract term for a hidden volt+freq combo).

It may be that the operating range for the EMAC removes that variability,
but with no concrete evidence and just anecdotal experience, that's only
the case for the AHB clock

Hopefully Mohd knows more 

Konrad

