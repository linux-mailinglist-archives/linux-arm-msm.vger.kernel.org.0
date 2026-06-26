Return-Path: <linux-arm-msm+bounces-114630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wdi1EbNfPmoXEwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 13:17:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0A96CC556
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 13:17:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TWTKILoP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="b/X0uxz2";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114630-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114630-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DDF6B302B598
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 11:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42AD639446B;
	Fri, 26 Jun 2026 11:16:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA303EC2DB
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 11:16:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782472615; cv=none; b=bLY4CdRjUp8iOMLHsii/pp/+1AtVDykYQuG6ng0v0zfGGvLZPwv0UtiPT6ST56JHZnSgWTNXOkQ5VZwRo6u0m+stSAjT96GbrJOwR7/ifPqGyU20Q6RYqsZwKsGjKLd2JG7PushE3k7oov58dO9KNuDGfVh/mjKeBI2SExSd2kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782472615; c=relaxed/simple;
	bh=WSyro5cp3FqXrJe9SUXnePJYJRbQ0+qoWkp0+F9Ep5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qsg21FVDnrLAL2NqvQSXyEgRo8p0hvsF7a2A0WxsRx19MTdj9LTmdqRj4KAG5XDw6/3cZmFYtozUTA7sT5qC4auwrz38s4CUEpSh7LDb5EKdBX3dlUIC+u4D+qPE4qHfKYo5bw/nZrh62jZQ0XpxQI6VlJyZDr1uv6KYpfWDI/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TWTKILoP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/X0uxz2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAe9w5500542
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 11:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pKwx830Tn5+ykf9/w29CwgY3uz1mJmC+sgylDuqgczk=; b=TWTKILoPMmRPok9c
	F7uYCz75HQWiGueItY2WB93D36uyexEUi7UEBnG6HhKFC2Wl7oCbnUUXQNLd1o7O
	zSl8a4m3RO5E6pn/agbnNUmj4K8e2TDL+X2WY6eDnUzEMSJfmq2Eix92gYDJ+Tw7
	KU88+Ms00WiZC/8CRRSQwiXOJbKZV65QH6yiLSrLMNR3A+sLI3LiO1I66gJQ8Z4m
	qZozbIkCqgtsYxFw+2hlgA29DxLq+lL5iX7xZaZymQk7C8Md7Dv7FbMzQmWjwtud
	krF6sr2eGhG3/UBgUMLJCcNtVVRNunLY5Ms4ELspa4+PjNQAdUb40CQsFP2pjPPA
	IBV+gg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1j1nhmhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 11:16:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92b110673a6so3204985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 04:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782472612; x=1783077412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKwx830Tn5+ykf9/w29CwgY3uz1mJmC+sgylDuqgczk=;
        b=b/X0uxz2tjV7uBSHDmVpAhmJnTE46DX6hb/VIBlqJ6fg8xXXRTSRqSgeFAydQ18Ig3
         nXP+wK7EBC+KBkpDhEOroaMDgXGDnwYFqBf9FHt6Fu49CMnoRgov3usNXCTmlgUhGsyt
         LGCdv/PtMeYQ42nYZgISl/qrZHVvyHnfpv3heBBFEfLwCeVKJ8HqT5g53Fi4d6c8BtGk
         uvI/XoCnWkHTyO+/3VinBU/PnDILv5pGvwdbvIy+fxSxMbFvw3mlrK4TfNghZSWXcR/m
         MeI8kfL7UYXnH1bHFzjSHJemh/Y2MYPxkNPReqwx/GqMsyZIAEDYnCoK/bI5AOZF25iS
         LrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782472612; x=1783077412;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pKwx830Tn5+ykf9/w29CwgY3uz1mJmC+sgylDuqgczk=;
        b=RcNIdX2UQ4BidJw6uzmUjjYOQL+qDcMQK1kf4RxV8h6igFHMEmeJNtA2VZdFk01st8
         N0cCd+OzGZwJHXOs8dZflQxBd1DAnN7Sz7nnVUJFnkPwhMU/f+3TWu8BXncRPXpZY0mJ
         zpKYMiEDJn7O25bz8J8USNIFNBc+F/tsjqfn7k/CKCryEyV0Lo9hZg7FfBvsoMWcdwtv
         RmsQ+dAzsC6zF0cbKolO/TOIEKH1AOuMX853BbjFvCref/YBX/1wkd8hm3FKRsZH6Aa6
         dcuFU68bsbRB5gkv0+tZVHTgb0GXCOaPCiwY9/Vz5y5fqItHumHqMR+0e4ah9UIp7o20
         7daA==
X-Forwarded-Encrypted: i=1; AFNElJ9z6mz5h8enUx6fO/6bMPLkmiBl/kqPlIcsgQG/K1rC9Sm8KNNJxLln2z/+HqiX1lrkbN26MlBZpOJzi98G@vger.kernel.org
X-Gm-Message-State: AOJu0YxEnu5L5k8fK71ECzCgFAed+O1b+Y+3zyF3bTAwy7Vl+N9w5G9a
	X1cD8SAoPEWD55HHsLa9XxaoPF/o5supA+zwHV6CkaLMhy/0BGtOS1z+ri2ef9t1M8r/dC40aIA
	ENn0Ugl+ZQySt32AGfoNyByQfIhGy3ENGBnupUAqk55NvZfMkfvUhF4KDbl+veMD77q0i
X-Gm-Gg: AfdE7cmqX8Ae5WZJgDCU7xc+NBqcbQ58FsQ2OBtYrkSig/N/IftDKLMCLs8wKSsLmI/
	6E1Y26kBNq0O1kploaT13iG1pooFmmh4mhCEHZCjvlvTsK5mKhAW9lycZcs0sIKT5Wsz2hPZxdR
	xLPaJpRW55hcFTST82/+Zn1E137FYLtFyYRNtjD2a8iAI1mHPRVvRodGBWhHRkh4CR5Mx5gUgtG
	r6VBzwJrd/Yvxbj+Hb/QlIC/C977yd4JWYFZtkFk/CgjOQw2I7bLNGoj/d6FfcN+ULNxdRM998+
	xj3KN38L9cXnF9iCcAdwqKuwfqeo+fMtH4JAdJiOauRthn2q0q28NGaBuEzxs/i6yW9i6vyD82r
	cT72AvHE1dr71zIg7uX0zz6jwlllsrATZSNU=
X-Received: by 2002:a05:622a:1813:b0:50e:6311:7380 with SMTP id d75a77b69052e-51a72831d5cmr60918031cf.6.1782472612259;
        Fri, 26 Jun 2026 04:16:52 -0700 (PDT)
X-Received: by 2002:a05:622a:1813:b0:50e:6311:7380 with SMTP id d75a77b69052e-51a72831d5cmr60917751cf.6.1782472611865;
        Fri, 26 Jun 2026 04:16:51 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c121cd03f24sm113474366b.32.2026.06.26.04.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 04:16:51 -0700 (PDT)
Message-ID: <02d8b102-fd7f-49bb-bdbd-62419c54a836@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 13:16:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: regmap-phy-mux: Rework the implementation
To: Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, usb4-upstream@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260409-topic-phy_fastclk-v1-1-6b4aaee56b90@oss.qualcomm.com>
 <178093139446.244194.9422100472802070367.b4-ty@kernel.org>
 <c675lcfptr4xgg4hcjp66unmuozgsvgwvtymh7on6jcipjrdw7@jy4h7fkwqwjg>
 <750856c8-ac82-4d05-9c8e-702d091e930f@samsung.com>
 <CGME20260626111504eucas1p1f9f7ffbd3655c400c6d7bd35e11fccb8@eucas1p1.samsung.com>
 <a2114981-632a-4001-a360-ab78542a1d7a@samsung.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a2114981-632a-4001-a360-ab78542a1d7a@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: caAtaIEog3ozMmW6_wnqGpj6TbVckFU-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5MSBTYWx0ZWRfX6bebDpdjHNL6
 XG4I/HboZJfZeH39u8qHIdZzrmbDvMIRgPiOvw7qL1iiZYvDKzf1rfFboHNcTOqI6j1lY/Fhd/e
 2McP+sIPhKXrn7aVtCOfH3+/Hq8uTVRiUsxiTImoddHru8pS4/Duz4iiufCbAWxhjsr+8W8w7JK
 VnL86/Y8eqoOToeWwURbN3bdx5sE9fqyRPLqTW2Z27uif8NGfIkLPl6TyrmzTjG3I/sMJpwrA6T
 QzrPHIWRcakfIjyQqtgh22EgiyHOouAoO1mvCchfu3b9NTGCgMxBydgLJJaDsm3IbDmWFCSsBSB
 0CX1rYylCFut2+Fh8OMnVsmZuVtnGDnQ9q8P/My9pfelkUR4WDeiViRGX9Y17ENI4saimxIm+PQ
 QIL84R6yrW5zgkEOYH1daUF6/ukYgPKLkriny/bOhPTyj6zQAYKvAOgcXVIrIIinEiz+ZB1q4te
 y/3nouRSvCKt9ZxNOgA==
X-Authority-Analysis: v=2.4 cv=W+cIkxWk c=1 sm=1 tr=0 ts=6a3e5fa5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VaNlFodcNc6lOBzK2YIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5MSBTYWx0ZWRfX3oGTw0hlw/tW
 BXt1Z/cki3bM6pAyGeBwIgt/m8FBtcJqKah6IWL5e38RXHQ+osWvHszpk+V7zGWBfq+zNKffo8y
 KUJqFCTRq2VNDQ+mPW82sSi/cR2HBZU=
X-Proofpoint-ORIG-GUID: caAtaIEog3ozMmW6_wnqGpj6TbVckFU-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114630-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:m.szyprowski@samsung.com,m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:konradybcio@kernel.org,m:usb4-upstream@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE0A96CC556

On 6/26/26 1:15 PM, Marek Szyprowski wrote:
> On 26.06.2026 11:46, Marek Szyprowski wrote:
>> On 11.06.2026 21:38, Dmitry Baryshkov wrote:
>>> On Mon, Jun 08, 2026 at 10:09:55AM -0500, Bjorn Andersson wrote:
>>>> On Thu, 09 Apr 2026 13:57:45 +0200, Konrad Dybcio wrote:
>>>>> The sole reason this hw exists is to let the branch clock downstream of
>>>>> it keep running, with the PHY disengaged. This is not possible with the
>>>>> current implementation, as the enabled status is hijacked to mean
>>>>> "enabled" = "use fast/PHY source" and "disabled" = "use XO source".
>>>>>
>>>>> This is an issue, since the mux enable state follows that of the child
>>>>> branch, making the desired "child enabled, MUX @ XO" combination
>>>>> impossible.
>>>>>
>>>>> [...]
>>>> Applied, thanks!
>>>>
>>>> [1/1] clk: qcom: regmap-phy-mux: Rework the implementation
>>>>       commit: e108373c54fbc844b7f541c6fd7ecb31772afd3c
>>> This breaks at PCIe at least on SM8350. The attached WiFi card is
>>> not detected anymore. Rewerting the patch makes it work again.
>> Same on QCS6490-based RubikPi3, after this patch the XHCI USB host controller PCI
>> devive is no longer detected.
> A few more comments. I've checked the PCIe initialization code called on Rubik Pi3
> board ("qcom_pcie_init_2_7_0()") and there is no call to set_rate(), which would 
> change the MUX to PHY. The PCIe init code only calls clk_bulk_prepare_enable(),
> but this became noop after this patch on the mentioned MUX.

Yeah, I sent a revert a couple days ago:

https://lore.kernel.org/linux-arm-msm/20260622-topic-phymux_revert-v1-1-f6ec85523840@oss.qualcomm.com/

The platform I originally tested this on seems to have different
defaults.

Konrad

