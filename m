Return-Path: <linux-arm-msm+bounces-107857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGU6DugFB2pNqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:39:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 202F654E9A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 39ABD300CB18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1893478870;
	Fri, 15 May 2026 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oJJieRKP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a6jY3bT6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71112330652
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844582; cv=none; b=d2wUuWSbossM0MtQqzIvZTQAJaXVzNdl2/+i4isIcA79g1vy0/IGnwsq3b1Fieh8+kBoomdafJJYhJM9WuJkj49h1JHNT2yxj4rkKhA+j7UC/b9/gc6J4CaIr/tJKkA3Ona6xavjDczuLoM243mZNvutOMuUeVlcdZuJOTOhRB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844582; c=relaxed/simple;
	bh=HL4XXTwUHCtAfy5lSSZ4iq43KCo7QdAzVeZ7SuFGm0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOGihYhkqEAzIBRGL0V4jIMy9ln/WXt3GmRJI2U+8lTUdLhxLxS0Exbz8TQfYvTT138ZA5YpeI+rBTepT0c2TJZY2UN1FS9UpO9IEa2NzDs6hqNDY9flt5SnnzmHJq7dFSiaD5nHrHWRogM81EQjs8nbHT9EVlA2HkE7oid7RAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oJJieRKP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a6jY3bT6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAMBPs3671009
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8PBfPdN6MnnDE3OmtYSDk0xuV/x70N/ULtY8YnSOZRI=; b=oJJieRKP8dTpMse4
	Pq8uv+TXTlen43ebv+V8S7rRCnabDSqn5REqUpO4Y+Cb46uV8OZx4LfsnEC0nT9F
	zoYtfUGDUyQT4db8Cvp0i5vfidgVXVNWSBhxPJ3POQ+W/DXynVGxKIp9yZIB0txy
	keWABJJNvKNDqBwMClrKkL6UJNzOni8pyoXCNZCPOJzHc/Wf3f5DUh2BDnDQp5IG
	mOUBrAKoC7ojAVRFh6+ROMYA5phW2gHdrD3VjE/sfii609OffJL/vYv0niUXvaJJ
	CcUsWcDidDwm33giURzNXgUud/+er8FNNqm/HtMqPBeVJBrQYh4i74wf/hXSB/X4
	6t5ftA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s33n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:29:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb39de5c54so190335185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844580; x=1779449380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8PBfPdN6MnnDE3OmtYSDk0xuV/x70N/ULtY8YnSOZRI=;
        b=a6jY3bT6CcWzxWgF/Z5kh+AG3aAuol2PfIjOru2X0l/ILPlyYWs8mhUircb+/Alvoi
         4X3E//b8AfYX3bOMwVWh5gDufoV3lq27zdZXmhnf/HFkjdEeVsQzNNJlkuij2qBzWgwm
         VYkgnlGUdBftg7XBxrKR/NpH3czX4RrOKD53awh81H9ODEGjQE8uiAvf39jsNyuV2cEi
         nmxmDWRAlIHWlRMTsoA/7pccBoA3YIlb6R8eEc2UKfgCwWyUJLsrAojQUYiVqTSv2yO/
         33/Ty2T3zdoUdQjU5yCRSdXSayeJ1HSOsbUboFdXUmWvOAoAXS9irtXLflKBcEXAPFhd
         nmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844580; x=1779449380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8PBfPdN6MnnDE3OmtYSDk0xuV/x70N/ULtY8YnSOZRI=;
        b=VrRb6hUlK/QfJcnCJfgmzPeg7BqQ91P9vqpHigeBKTl7w7QlcOYuuCA7DM1Wca8Nee
         H4734Eu6G74bu78wfHVk7wXlBNJu0zRh1c8n2tcaXdWo/HrjoDJ+XfsugPkAmxg9Fcp+
         mVX1oBHPBsrsRJyBLD0v0oSKGmqfgWqbS+480Lg1SBZePYR4tZngWmHtxfU/zW7GmE5n
         YQ7eABAYrAqsH03y7V2y2wIdX2J9GgccGqDLwkcBLSZ50H76zqEGMrGP8HDzD27bacBV
         XzgMa3cGEx9ueeW+Gz2poGquee4sLui1y4OMOThNe2tcxOnvuIZvp+bUYMwJxmca/d0U
         Hrag==
X-Gm-Message-State: AOJu0YylV3HKU8M0J/8ZgoTpQRxvJgfWPXtk99WHAJlXiZ8hGgkkn7WQ
	8jR/iFDZUCEa7okysuFZzlLG917ELKO24RauY2d+p9v8wTCW2OfuwtX+Hp3iDHpU3wPHMBR+h0x
	+UYXQpC1Idx1UACFC45q2xFk/mPjU+AImXIQm0p098Cex7WLCXbxML9BLuJekATj9qY48
X-Gm-Gg: Acq92OFQXxs9Z7X2WQzXp75fSolxiDd2deO+1P4jmAXH+xW6JTF6XdKLsWODboAuGfb
	LePT+o9Jvfmy/savZDWZCQdXJlY+UYjqds+jXfj3N+KHmN7KtxMnN1rbuUp/91jOEpE4DFCgFf8
	6wTvuuOKL0uXfrqa9MtGa9LHhWDUBMg3ulPtsG6BeE67qkMlHPP9Tyo8rjtuEPeOFGgsPWqbQ2N
	f+I9/R4tZPG6/fA6WCcBYVTOIYfaR/x+gZDxPqCJdoT8k84akAjpE+0gZnL0AR1Z/OVTeAoRuB1
	XBdsyYUoW8Cewg70NO84c/3sHShgmYkKNwSGzmcyMb4MZYSMai+xDHQlSatvGYwid5u/R+Od0Q1
	ZAImDLK4CaWmE3eHxWbUCs/GP+uLWvJ8R5SlDPj/5LihM6rsSypfODX4KVAgNXfw3ZkKoar22q4
	xQ3V4=
X-Received: by 2002:a05:620a:690d:b0:8f3:5b1d:ed86 with SMTP id af79cd13be357-911d1c00cccmr370338785a.8.1778844579872;
        Fri, 15 May 2026 04:29:39 -0700 (PDT)
X-Received: by 2002:a05:620a:690d:b0:8f3:5b1d:ed86 with SMTP id af79cd13be357-911d1c00cccmr370336785a.8.1778844579499;
        Fri, 15 May 2026 04:29:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311660f6bsm1874474a12.17.2026.05.15.04.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:29:38 -0700 (PDT)
Message-ID: <1d559fe3-c488-4c23-b3b8-4974eec3e38c@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:29:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] phy: qcom: qmp: Enable ipq5210 support
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
 <20260515-usb2phy-v1-4-5f8338d466bf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-usb2phy-v1-4-5f8338d466bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfX/pKb1pOMMR0x
 4gc/gKlaGO7cjvhkodoRFKRyFOuVlI+bqwhiiopxu9WtDeXlMc2XLXKiWqWukx8GNZnYYJ4cO22
 uCgG7wmOvi5FyfRdxsxpQiP05v2W/k2lUB+JtsKXtlcvmu91Cz5z9wjXt4F+bdTWDdIGYG3AP7w
 +mPeLLMR5ofrdJxIg7d4YaPWmEi8T6/zL4T6fhBDBFmui2FH3ORWCHS5IqGHRyqSJ1TvfTNwc0L
 Okhxrn2CTUokxy1bdK1281D2QAQVK/NaDdYEo5SqunStUUxAwuT4jvOpO0ayvZaweEx9fdmQqEf
 tP3K1tEyt1k6NT/YacM28Nfww2Q9fmselx4E9tuX6sOlrt3/jVkN+pMZmLn1xWFBW0EFjoS5m9w
 LSqzaGHlG951KPkChKJB9BcqFF63tgSgYWFMiQwb/Lck7O8EZqsBdgDcGTZkgmuW7qkpJBGXuYw
 BEJdGBW+chMk25sMa1Q==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a0703a4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7VrQj88toOM5sR0hJNsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: kNidJeRSPr9LQgDz3wDFoxQGImvtEXDw
X-Proofpoint-ORIG-GUID: kNidJeRSPr9LQgDz3wDFoxQGImvtEXDw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150115
X-Rspamd-Queue-Id: 202F654E9A3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107857-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/26 12:47 PM, Varadarajan Narayanan wrote:
> Enable QMP USB3 phy support for ipq5210 SoC.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Since they seem fully compatible (also in patch 5), could we simply
use a fallback compatible?

Konrad

