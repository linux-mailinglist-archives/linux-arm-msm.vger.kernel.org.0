Return-Path: <linux-arm-msm+bounces-113205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KpIUDcUSMGqlMwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:57:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3A0687693
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:57:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=okD+eTdY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iO3kFl8Y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113205-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113205-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E4BE304AE67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E421C3FCB2B;
	Mon, 15 Jun 2026 14:51:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9617B3FD12E
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:51:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781535102; cv=none; b=DNoZO63k2bXsGTMjX02tAGVNpQ3zXO3Yl1H3CMx3oZph7dx/8MBL7LvCgsFbvAjgr9LzuHbuUDEbrSCFpcd+H5qUL4GNJBqWHNWtS7lmM+jIBZfAujmLleIVzWzvIdOIO+pSLdxL2uIa2aS6yUT7b7ZaPOGl9fzmqrIPn/fa+y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781535102; c=relaxed/simple;
	bh=pnjFXfHvTcgzr/idrDh0pO+usNWN9B3o6L5QG6iq23c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ruko84QIof5mFoCQ9U4Z3amuPvZ0aF45/K6MbamG8F/JaukV61NiEd5GR+A51xT3quUPEewH6bAYKEEXKvU03e1paegohPoGrqU2LSWgasxUr+KYnmS8CRBoWejCGqMl5rPXbmWhCDM6o1aPGYuiyY2TH1w0lE+/p2lU1YhpgKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okD+eTdY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iO3kFl8Y; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FEYTTd857936
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AUYS+wae+hsbFs8L1IrRqpyJhpzYX6yweeTpXfvcbo=; b=okD+eTdYYLRbfln9
	V2EKlJRaGlSkmVYAV7zIR+agqfTfF5XpkySQMSi95/GrbVcPpMFLpD4Sal5HBCmO
	g7LlJspvBprjwrioGl61vqtKEblz6xSfMgg8y5DJdCQY7pGz5o5exenV5NmHKWu0
	/fOdphcUtvm10OrN24ecj/j1oclbcm8M1AtBjYTZeMwAZJfxZUVjWVyT/yfW4P7n
	Qcu0lORxKvVdxzOvejhfRHS6XgbFOhBTDpOrhT94Kj1FT1ss0cm1+A4ryo4Be1OM
	EE4WnghlM69AEtBiMgQbvJA+NnP/AgPb3dodYJ98vm+bdy5ybFUywVdfVcuNG0zK
	Rg1LZw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etd2c9smr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:51:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915737aaf0bso15974385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781535100; x=1782139900; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4AUYS+wae+hsbFs8L1IrRqpyJhpzYX6yweeTpXfvcbo=;
        b=iO3kFl8YoJEDT73YUlRUMVwQ+IGW4E2nE3jKabiiOO/5opu5RrJMm3SMlbxhyUzwoG
         pVFIkQLI0o13QhCRK/hgpeX1DUNgK8E69yMayT1gkPpNWhZoMs/Gz4msAqm7QwnW5SOl
         7+nJRroqsQHX+ZNULQBYM1QqpuZjxvzejD/tKNgnEVCI8E2pfVrU8Gkq11ou0n+Rg/En
         CxFunOjuO2+NhvBM67mg3rwKddcnltRkROBa7iRXOT/bqoxH5kmanYLscR+GcnFLfMDO
         1096o+o5YmJ1Ibr6PhxEVdhD5PpBe2XaBqa5bLHFDoGRhdCmgIghnJJYezWw2dxihoXG
         Rr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781535100; x=1782139900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4AUYS+wae+hsbFs8L1IrRqpyJhpzYX6yweeTpXfvcbo=;
        b=BESCljVsrdwQBLytfIQd9hoSpwPDGZKYO0OXvESrkN7VNMCTtFrA432h8aYFu88k3x
         Kyo9K+pbuulTKxXC+HQPhYrV7V2bGNVwwIX3rmFnPRhgKYy4I7EhEDfz78ennVksd7a8
         MppC/cfA3E/4g1236DtUOcb8yJrwQBgzVHZJNp1fWTenRBb2uitkWEgllSH3woYD7YiE
         LNuRHix5YjcP+ZZW8wcxe/uiCPOuSrduDMfhrOVxncTRkDjvWFv0wumjTLT2r0LY9+by
         8PnJonyWsBDz02Z7Jjben+SEAORKO1B/jn4mWdBNsqPE8rSahmSuREQ0X1wz9nN8l5Q5
         HtKA==
X-Forwarded-Encrypted: i=1; AFNElJ9rzDFy/u6ZzAcZEgl+iE1rWT45Q/JHThnqCy0ZySo4BCBHof9FiHuM463G4jOj2YNQTK8HdVyKODPkz9o2@vger.kernel.org
X-Gm-Message-State: AOJu0YynKGhJHU0H5iwWsxyn0x7ZHbfuRbHh52h3xYw2UXbEhvos0v2B
	5eJ3ToNsH6hWtgLZpbeFlMZP+sEqCQ+RYS4Z9QWyNnwLtXkOj2KIyq6EB94S/0qBC5OwV76d/7a
	Gjl3q+gRIUcrq2locuZMRf8omvt+bfx+uCaf1ErJ5PiKWh4faMxnQ2/Vnno+Xo6NPUNsn
X-Gm-Gg: Acq92OHUcLoJRp/M+RbO73AafYueMoPTwOCgyoF2Fnpsqy2dS6BK2VdH3nsq8YzsBUs
	LBap0x4Xhz6o0aSBCNlqaCJ/iZEGF7kDYqbybBSTTmsV6MMbwAudPb4OVjxZAYLnQPtIJj61VW5
	ET7USs57Kbig6Td8vmjQwmsVbtkEY86JOnqWECPF5RhcmHbUlTpzx0SdZ8GKtT3XKif6RzNUCaT
	M4zUUA5xK7ftRqwd+xc3sSCY+K+rX6dWwn2HByYx5jr+KG4Ir+3eKYAQ+SNyGZYglWkWm5BuKyv
	SZs89AYjr9UrY+zXihQ4jj+tSyLc1s53t51yOrcuCuPDarX1UvCb5UIxxSlFMzppa5I5gLXSRJ7
	qOiZeqLrmQ/bUtqjsEquP/fcH3Dfx2Qw+mfZyVZbEe1D2dw==
X-Received: by 2002:a05:620a:2892:b0:8f3:5988:f97c with SMTP id af79cd13be357-9161bc9eeabmr1354305885a.3.1781535099773;
        Mon, 15 Jun 2026 07:51:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2892:b0:8f3:5988:f97c with SMTP id af79cd13be357-9161bc9eeabmr1354302185a.3.1781535099280;
        Mon, 15 Jun 2026 07:51:39 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937949bc64sm3651693a12.26.2026.06.15.07.51.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 07:51:38 -0700 (PDT)
Message-ID: <fef227d8-4ad0-4884-98ae-fc48056c3856@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 16:51:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: common: introduce qcom_cc_sync_state()
To: Brian Masney <bmasney@redhat.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Val Packett <val@packett.cool>, Saravana Kannan <saravanak@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
 <20260603-clk-sync-state-v1-2-457120eed200@redhat.com>
 <xtrvgetj3ybwuceez6mymxw4cwa6sqeycoz2hs2zztozeb4oyb@uuhtzbludmzv>
 <2f6dbc37-7ee5-4cef-b39e-455494fb31fd@packett.cool>
 <ncgma77ckduno5645xf2hcmakmbpwub5d54p4zcrhz5pbq3pij@o257r3t6p5aa>
 <ajALNcLMlTThdilX@redhat.com>
 <68a86037-bba0-4cab-8a1f-b0be78f259db@oss.qualcomm.com>
 <ajAQqVB_knGO-bqL@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ajAQqVB_knGO-bqL@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE1NiBTYWx0ZWRfXxrZp1vKlxSdo
 e103Gq14C3Y4fFBT+h4ztOvuq0ttPF1YRVbsVBlt06LjJ/8loCDMyo7KEuGHh3fSUPA/vWoH+j7
 zEwz/vr7sVkZgJcq0mJSeVWrFCC/8EMqzRAyNNZHFbGkzm1y5Lzk3ffxny9xKq8K7+/nprO8oy+
 xqqhsTjjfaZwMGYTzShyjBG7GvepRja5xWZTNGFSLyD6rwT5X4YH/K+5YZcT4G+wAeqShrQVE5W
 /x9od+Qd0OSPpW0CJcj+kPFmXtq2P+5IXi826x/gzloaa/hxvoaTSkGkkW1f0lNeTx4tWbCZRmu
 rcyQGHg9x+R/BmWAMKQng2YEHQum38Fad9r36Hi0fwWHoXuW4Zdm4Ei92mVs/08NCLx9BY2FCNI
 msy9lKhTwPkknZbaGutkfWm3wkUAb3kf0QstiHSnF6mQZwetDIzUne4oJ9rcp6a77USiI+UfJOl
 vWlQgisyWwNpXYfEJ8w==
X-Proofpoint-ORIG-GUID: Kvv3QvVxXdwbVpoxk_bTzaEe3qgrPgHr
X-Proofpoint-GUID: Kvv3QvVxXdwbVpoxk_bTzaEe3qgrPgHr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE1NiBTYWx0ZWRfX52mQIWf0md8+
 aoryo/DMmHQuLEE5OfRSVbLq0qc8CLgTCWdE9dw46vQsaAgtsOC6RVzW5MXyC0DJOZ9HjmVV6uJ
 4ZX3wfjoBhG7mqL/KmHc/mVlndnwJBE=
X-Authority-Analysis: v=2.4 cv=MsRiLWae c=1 sm=1 tr=0 ts=6a30117c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=OVboD8nU07OjOQKM4TkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150156
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113205-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:dmitry.baryshkov@oss.qualcomm.com,m:val@packett.cool,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B3A0687693

On 6/15/26 4:48 PM, Brian Masney wrote:
> Hi Konrad / Dmitry,
> 
> On Mon, Jun 15, 2026 at 04:33:17PM +0200, Konrad Dybcio wrote:
>> On 6/15/26 4:24 PM, Brian Masney wrote:
>>> On Sun, Jun 07, 2026 at 01:30:03PM +0300, Dmitry Baryshkov wrote:
>>>> On Sun, Jun 07, 2026 at 01:43:06AM -0300, Val Packett wrote:
>>>>>
>>>>> On 6/6/26 8:15 AM, Dmitry Baryshkov wrote:
>>>>>> On Wed, Jun 03, 2026 at 10:21:47AM -0400, Brian Masney wrote:
>>>>>>> Several qcom clk providers currently have a sync_state helper set to
>>>>>>> icc_sync_state(). With an upcoming change to the clk framework, if
>>>>>>> sync_state is not defined for the device, then the clk framework sets it
>>>>>>> to clk_sync_state().
>>>>>>> [..]
>>>>>>> @@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
>>>>>>>   }
>>>>>>>   EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
>>>>>>> +void qcom_cc_sync_state(struct device *dev)
>>>>>>> +{
>>>>>>> +	icc_sync_state(dev);
>>>>>> Only if desc->icc_hws != 0, otherwise it will mess the interconnect
>>>>>> internals. You might need to set drvdata to desc.
>>>>>
>>>>> Hmm…
>>>>>
>>>>> Currently icc_sync_state does not seem to use the dev argument at all.
>>>>>
>>>>> How would something get messed up, now or whenever icc_sync_state changes?
>>>>> o.0
>>>>
>>>> Yes :-(
>>>
>>> Sorry about the delayed response since I was out of town all last week.
>>> Just to be clear, the missing check for 'desc->icc_hws != 0' is a bug that
>>> existed prior to my change, and I should label it as such with a Fixes
>>> tag when I post my next version?
>>
>> Up until this change, having icc_hws > 0 but lacking icc_sync_state
>> (or the reverse) would be be considered programmer error
> 
> icc_hws > 0 but lacking icc_sync_state (or the reverse) makes sense as a
> programmer error. However...
> 
>> Starting with patch 4, this gets assigned unconditionally, so there's
>> no prior bug to be fixed
> 
> I don't see where that situation happens here. All of the places where
> icc_sync_state() was previously called, the new code now calls
> qcom_cc_sync_state() -> icc_sync_state(). (There is
> qcom_msm8996_cbf_icc_sync_state() that needs to be modified.)
> 
> In patch 4 of this series, it sets up a framework level sync_state()
> callback with dev_set_drv_sync_state(). If a sync_state already exists,
> then that call will fail with -EBUSY, and it will leave the existing
> sync_state() intact. So it's not calling sync_state twice. I will
> clarify that on the comment.

Dmitry and I are referring to the situation where the clock driver isn't
an interconnect provider but icc_sync_state() still executes. That could
not have been the case before, since most clock drivers didn't come with
any sort of .sync_state()

Konrad

