Return-Path: <linux-arm-msm+bounces-103518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KkEMPgM4mkg1AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 12:35:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D39F41A2B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 12:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53BA33018769
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 10:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5963B776E;
	Fri, 17 Apr 2026 10:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ONnlxy8w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SiwN9Y2U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB5A349B02
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 10:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776421863; cv=none; b=BAxY6gg1MoavxGIQCGnA/XI0MYMhSoqyOnh0PW8sgxexpenu36KMmhMNOv0YzXoCDRv8Md+Mb8WPPhv7jf5Wjz3yb9fARSj9aQpwCyqnsrQGdfBwPebxCrNK7Nslro5On/THl/rkFO6uHNcd6d+2JhNM0vZjlHdN++TdsbAHepc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776421863; c=relaxed/simple;
	bh=GCweCtXAwUWPovbXycTA4AU3/QkBeGAdsJflwLi+jcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iS7pKGcVBn4eraHkf2mOIGszTdd7f3XhNaWNb1B/nJPQHL9a9LiwyTmBW4ka4ULReKtNWuA93boNibOMF4x8AkqvNi0b/YsjdG7GwK2ceup8MpzPFjjKxtq29nbAH9g+uj8/aRUPA0guT0TrXQbBO1jHBsc9YYgZebgkqZ2T2Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ONnlxy8w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SiwN9Y2U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H8nqtX3100227
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 10:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	egCLcH6exh4Y768gVMGcYkrfeIsKeLS76r+9rfHPhec=; b=ONnlxy8wz24eqOl8
	qxmPf1uN9mFaQ7lg2tA16zJSGHKJS8tWdXn+Tl11OdfRLQ7Er5oaCIGEPi32fgBY
	BtHnxAycP/3SeFEyujlxd9FIbsZQo5KbUs55jfnLCJrSMIWbSdEQXiwiET+Arv/g
	Y70eBgdMCnAcR+PQjuY3MF5xpffco+dp/vzXzmiUCTmic1oJQX3ACUCcQz0gPa+s
	MT36KxBLNpweynllXWCwFPmDm3CCoEFJKTkyHWxTbozIpQbqwxHJiktr/HG+Uc7b
	1Dls54zVXudFP3Tw10q3jiDihsxP0kPauPjvMzVseeG5ohtBRShOg3xf3HIV3yUF
	AJDvjQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkhpu0ddv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 10:31:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d9f1bccd7so1321741cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 03:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776421860; x=1777026660; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=egCLcH6exh4Y768gVMGcYkrfeIsKeLS76r+9rfHPhec=;
        b=SiwN9Y2Uv6W59E8rFRmAyvoXrrpR+p6qaFcaGEL+mCsJf/XVSF+XBGLU0MuA8TBEgg
         SViNRZLEl1T9ldhL0LAsgzONp1ym8oqbxUoLBEK65AMGdEoqZ4rMZ3Rj0QSBARCdMZkf
         qEirkfnvZybLtWuMUfoKDycZvvfVZhnG5XAkji0gvk3mVliG+ug3VJK6R8J2BzsAMwnT
         mjGzPDnuhsfz/+0ae48sdwSnsrE45tA2p15kp3KnOUZWgj54C3GyJso7gz0EgvaGbd2g
         yegBgDfWR5IYVhc/G//29MzKM+3KtzTyiDdKwBdZ/r8sYga7cK930piZZwxOmPsjcUJW
         wWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776421860; x=1777026660;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=egCLcH6exh4Y768gVMGcYkrfeIsKeLS76r+9rfHPhec=;
        b=JEJqUy6plu+pb1u/mDVU7BDUjUq+c9evlm/reNXGsSsEADaOrhS8it6fiYY4X+KByJ
         whmMeUCNT6NiOQKyKtNu1+P/YgFdPMd7mEIe4goEvve1BXl6CbK4srqX1ioghaxjQ5K0
         4Lai/QYFCJs8ISpxqG9wR+PQVNf/2HIOM2KGkgvvevgX5rUibHdtBTRp3GGxeFlD6PUC
         6RuHjZPWO4LH9S2AIL+oC7zDG4ZtJyWb81ujKOjxDvQZMJ+FTyF4KuAGCONXjfRrsMSt
         NLLywqQBzIfbX8em14sS/ICRJ9+Gch9bLzb6J2e1DgNJ70BBTNrb2Pyr5uHW0FmZXoVA
         1Tyw==
X-Forwarded-Encrypted: i=1; AFNElJ+FkXeY7vSkV+Ae3twXBT9ohy2WoTbABASRKoYG3Ly2tfzV76jHN7hHoesuCd430W5RGX+4PnHDSyZwAJX3@vger.kernel.org
X-Gm-Message-State: AOJu0YxIn9J7e9fTd4ab+FbiN8944QDcQmIwZdJIah1QkTgzFLxIVzSK
	ZOBp6SXAU50eba/WsvjoPKWrWfSjaO2KFHleVxDIS6yc/sIh2LoJqkpXAdRE6G5PXtM08YWmu2k
	ejBWPbMgkYNKWcCrvLFwmWzQEopG7vjN44rfq2/7rOZF6o/sOvOE+wzRwSeVGdGD9TPRh
X-Gm-Gg: AeBDieup6SxXZH3yUyBzlFuNSN6Vp2fGbzxsXP5myxfc8iTELH/gV0B6+DB+hrYcIFy
	jlnKTsA57madWL2FrBcJoKBinHi2aI57IyHbWKKpmOLahwuuuZ+XZwqj04ct4wzRYdeq8Ve1nlZ
	yIzv1MDF9/dgcw9pfhI3xwnRAcQvWRr8d8gn2ITtCGYgP2JVbdG9BUTmk1F5k4f5ufcVoCwWAWC
	HZDTwx4pFCdi9NbQSJO/nPdv0eUgMu/rTxThbSBGk6ZbxjuJglKxQE1uwwoO0PW5CHyZUE9WwYk
	THw5wcWhERsdI5KefGJ+V9UWgANJNyb1cRG8rYph6vLWrehlxn7g9HRxWclrifFr5RDGkmNl1pn
	rSU/qwTVl8I2esKjPRV+ZHQdYU8SdFqOKH3Nhs4XC0qT3tqMnP+im1m/iPuZlpP2U6a6FsvFLEf
	fVrt9PVFzgGSU7sQ==
X-Received: by 2002:a05:622a:991:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50e36c9d291mr17924261cf.8.1776421859921;
        Fri, 17 Apr 2026 03:30:59 -0700 (PDT)
X-Received: by 2002:a05:622a:991:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50e36c9d291mr17923871cf.8.1776421859400;
        Fri, 17 Apr 2026 03:30:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d6f63fsm258128a12.31.2026.04.17.03.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 03:30:57 -0700 (PDT)
Message-ID: <b4dfbbc0-d45f-4d65-8e36-0c65e51f9e96@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 12:30:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/4] clk: qcom: tcsrcc-glymur: Migrate
 tcsr_pcie_N_clkref_en to clk_ref common helper
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, johan@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
 <20260331-qref_vote-v1-3-3fd7fbf87864@oss.qualcomm.com>
 <ebce5979-0ab5-47ff-963e-68e27216821d@oss.qualcomm.com>
 <ac306hTHe3qVORk2@hu-qianyu-lv.qualcomm.com> <adem2WKh2B-Leivq@baldur>
 <adyV7qKQL+SJ6TxL@hu-qianyu-lv.qualcomm.com>
 <3d4a12f1-a9ba-4955-b018-f1c271aab766@oss.qualcomm.com>
 <z4h53al3dcy5u63zglu4rdavm3cse6sy2bbha2kxxepplawnho@4pwg7fx3cmnj>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <z4h53al3dcy5u63zglu4rdavm3cse6sy2bbha2kxxepplawnho@4pwg7fx3cmnj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Kd7idwYD c=1 sm=1 tr=0 ts=69e20be4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=iRxhbmNlmaEF0NwQHpcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: IRFAQg4eJl83238RzN7luTqjtfUoTt_I
X-Proofpoint-ORIG-GUID: IRFAQg4eJl83238RzN7luTqjtfUoTt_I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDEwNSBTYWx0ZWRfX5UeVTZSJuFMF
 MnbrqBpzz/9Cv1AXloD5YvYH+asa5bzYPzI2ggowq9kueH6mbozRESS+BPpqe7aWsl1DNEKmH1N
 s/14lPSE+3/Fq4WDwn3TnAW3/WOqKZICSD3mxJ2NBcCSc7kgRxqFb5WnfOdoQJDwqnTsunE2ZSc
 eMgsrJwg8p0Y1BBxjYh8lbm/cBNtK0XADtJ+qs9L1PzIAZ3pPRFpwRuQqVT6JRn2mvngBNa5mrI
 yaT0kD6AVrrN/tfOEYezS+fXyx6gz0rL6HwmmFk2RF3nirvPrNKmTvzL9bPxuu8SSfqAWJFHWOU
 ImnMY8Ki9o/Ivo0y6+l2jANXu2BPZGmvvy+JvcZ/6ZXBTWY4BpqhWJyN64fZBTA9i/AGKWB9CY1
 /IB+1GHw7VGkXkRCt1vxapPGhMyBAjS1YDgAINkcpvn8FP3QcmUi85XDe5liAte6k7fY9cqApvy
 98dId0Lr+iNYVlA75zA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170105
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-103518-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D39F41A2B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/17/26 11:39 AM, Manivannan Sadhasivam wrote:
> On Mon, Apr 13, 2026 at 01:18:16PM +0200, Konrad Dybcio wrote:
>> On 4/13/26 9:06 AM, Qiang Yu wrote:
>>> On Thu, Apr 09, 2026 at 08:19:41AM -0500, Bjorn Andersson wrote:
>>>> On Wed, Apr 01, 2026 at 09:47:38PM -0700, Qiang Yu wrote:
>>>>> On Wed, Apr 01, 2026 at 10:05:12PM +0530, Taniya Das wrote:
>>>>>> On 4/1/2026 12:05 PM, Qiang Yu wrote:
>>>>>>> diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
>>>> [..]
>>>>>>> +static const char * const tcsr_pcie_4_regulators[] = {
>>>>>>> +	"vdda-refgen-0p9",
>>>>>>> +	"vdda-refgen-1p2",
>>>>>>> +	"vdda-qreftx1-0p9",
>>>>>>> +	"vdda-qrefrpt0-0p9",
>>>>>>> +	"vdda-qrefrpt1-0p9",
>>>>>>> +	"vdda-qrefrpt2-0p9",
>>>>>>> +	"vdda-qrefrx2-0p9",
>>>>>>> +};
>>>>>>> +
>>>>>>
>>>>>> TCSR clock refs are just not for PCIe alone, they would have supplies
>>>>>> for all the ref clocks. These supplies can also be shared across other
>>>>>> clock refs. I think it is not the correct way to handle the supplies, as
>>>>>> TCSR does not have the complete supplies map.
>>>>>>
>>>>> We have complete supplies map. You can get it on ipcatlog. Here is example
>>>>> for other instances eg USB and EDP:
>>>>> - Glymur (eDP): CXO PAD -> TX0 -> RPT0 -> RX0 -> eDP
>>>>> - Glymur (USB4_2): CXO PAD -> TX0 -> RPT0 -> RPT1 -> RX1 -> USB4_2
>>>>> - Glymur (USB3): CXO PAD -> TX0 -> RPT3 -> RPT4 -> RX4 -> USB3_SS3
>>>>>
>>>>> I only add supplies for PCIe in this series because USB and EDP vote these
>>>>> LDO in their PHY driver. They can remove them in PHY dts node and add same
>>>>> regulator list here.
>>>>>
>>>>
>>>> The regulators are reference counted. Can't we add the USB and eDP
>>>> handling here as well now, and then after they are voted here we remove
>>>> them from the PHY?
>>>>
>>>
>>> For USB, I’m not yet sure which tcsr_*_clkref_en each USB instance in the
>>> QREF diagram is tied to. I need to confirm that mapping first, I'm
>>> checking with Wesley Cheng.
>>
>> I think on at least some platforms the reference clock for the primary
>> USB controller is not sw-controllable (so we wouldn't get a handle to
>> toggle the regulator this way).. please check that
>>
> 
> I would suggest we move forward with atleast PCIe regulators for now. Since USB
> and eDP are voting for these regulators on their own, we can work with relevant
> teams later to switch to this model and this is not going to cause any
> regression for them.

I think we can do that, yeah

Konrad

