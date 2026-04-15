Return-Path: <linux-arm-msm+bounces-103242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CM3yMsxG32mFRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 10:05:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 930F4401ADA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 10:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88DBD304C0CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 08:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4B4391E44;
	Wed, 15 Apr 2026 08:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sr8A4/qv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fTe5MhYL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F647392811
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 08:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776240320; cv=none; b=jRuirUbZTC+c45yoD/Jr64QSL6PUO9TqOzUITNLTzcLQTOgleB0GAlNVnL0+LikJWBy/hibgOknAOuvDoJu+rrk6juW7Kp5zV7ltys7Bwo9DIMav18YtdXeHr3KAKG23P7Rgq/WVFgdRhR7rnMh5UFvxq2FRMPbyZzU7OgFmRWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776240320; c=relaxed/simple;
	bh=FsMYiBXlhDeyE+WBeLh6LxOPoYa/d4x2LdyGcGWIHME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rh/EUjsiySfRr1cl1ijd4wg0ifsAbKnQF7GOu3cASbPFX+0fD0y85Nruq+V+dZaOJjjJRL6ShJzhw14jDJQshmBtpDOYBOFgfJ9D6VXy2v1IfbsShTlOvV9ytDpDh1RnFscNDi7N9j0OeWOTdtQh0uRdvcT6rFQNik4/ASd8ylw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sr8A4/qv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fTe5MhYL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F4FmjJ3059047
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 08:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WvTHObfvEHkHc3k3Mpuu7bQ/A/8paw0PCtT4c0XoiDs=; b=Sr8A4/qvUcdG5358
	g8PvTYXsOfY/bCi5IKnt8Wf4SgJ8Tqz5gWk0A6bV5idcrdCjazHxwofjQlDnC7eu
	Sy46jsWoTxIbDgnzTzUEBe0NQISdHXeCKuUU18JHdNAI9LMKlhpyA5JTCdxO4QRv
	blzImh24CxDXHnOwhRwZlGQkaPh0siiHM40SOdcd/WKQBVxBPRVQkeEskiSgtLLn
	xU3sbh/bUeChGNeFmBibbpK1hIZcfhneKx/9inKGfbPXG1etyo40/1RfHT0zUl5C
	+0SWiGsr6WxxVpI0jlIDEHn/UGN/+ynsVUJ+kc/qutzAzRC1fnNfc+5UD0BCUf//
	+zsL3g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhtept8nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 08:05:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d1d81dad37so161152385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 01:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776240316; x=1776845116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WvTHObfvEHkHc3k3Mpuu7bQ/A/8paw0PCtT4c0XoiDs=;
        b=fTe5MhYLHYxtRimh+C+VjbF/eM1X7JjiA5DDST6rz1v9+Y6PDuTvBqMGoHBPm9NEtn
         farXl5SKopu3BZW0JjPOWim9dd/+0g5cmIiAk5JYVcD+T11krVczaVIzxXb5TD97GvTZ
         eyBlJO3F8pCEmj/TYs0JtTHddVY5T7wjAsLzNSYKJmlsk2Lj+FDAYO+oBgqNyuJCC+vQ
         S4vAknvLOQD08VUukGhmQ2fnTE0ywoabgy/GdIqFzG1kTR7zGSp5PH3cRW3KwVagVXmO
         rEyiaSxe9sgpHXu7kOV87v7hdoBkhBUtStRQg8sPEck7oOOOCZI2HecGiALzhNV52odP
         9dLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776240316; x=1776845116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WvTHObfvEHkHc3k3Mpuu7bQ/A/8paw0PCtT4c0XoiDs=;
        b=Q56EeVWUSGE8jJMqHBoOYKFLiN0+6k/e/yszk9HzRFCsYa0Sta9CvpEpeWweKMc9ii
         dhJMNYTqyNamJaHWWS+Y7qoBoQE1U0WymC5/dy0eINo3Ae0ACBCfwFL5KxJkFntHFVl6
         r+mjLVbsci3mKSxZ81/IAYGAoqe9B5jzLmSEh5DHXMlA3MpMF8AMgqlFjPUWvo0EOdRA
         f/VrRd3AbOA2u9QyxoHJaN0znZQLpnLbENpTI/Rw/ugJjLBrXJfuJ2NpwQZLuToc3RzB
         5oAVN5M0hkGjciNhTBCeOCNuhpI3xwZXXFz8zIcqkBVHXQhJ2FurN0T3pEtwgFb3G4nK
         6IvA==
X-Gm-Message-State: AOJu0YyBHwL1RlFrghMG7CZJuU8E4m1yiyK16sE8RSZO/BZ3CNjVMh9/
	yuKeiwax7rHp48BB5RilI60SNcfeZzsd7avZikl9BZnN7Y7WQvg+sH5Goh4wlgxkzR1KzuvduKZ
	s++iKcHJMvzVB2deihTfAnaqOP83XpFzvh/WvT3hPGnkO45tILmvi4a8Of0NJy5COOXCM
X-Gm-Gg: AeBDiesh4uxdLBJQ1Fp4THV4CIpApytNlJA1yR7ttlV4a3dssYmjteTIK/69ILAFpYe
	G6vIERnDjNiyBzFmj9A1npPPVSyS2pWVdkJvR/bUn7Lx8fvtBWaQOxIpCXmn72wvnijdqTyW0BG
	N2b1uGSj/CDeOFduHjd69LDoqRRM53f+21izDQ/FXQZcKBsqJyPJFuu/zYoXvKOLrANc4f3cBSm
	DThy7ytFagGKh3x+AYMIQs0c7oMFPMsCa6aoobJqVYiJx5WPrjOCC5Ky2NE/6xeo9TNvB07YD28
	/n+YfuvctT8WtI2he0Za+7k0gXn6bTPBxSHVmqiXOAMFgmqqQqbkvE+4ovBiBR8n77nVMj4OtpV
	w7MA7kBXj+saQoSobrk6n0LNhVLtQxvoYRHCfL/DaNM0MNeDQvzdRI5oHgHO83TNewh6eSovGL2
	VZeD9yBbXtdFQlAg==
X-Received: by 2002:a05:620a:4609:b0:8cd:86a2:340c with SMTP id af79cd13be357-8e4c989a2bemr153663885a.1.1776240316558;
        Wed, 15 Apr 2026 01:05:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4609:b0:8cd:86a2:340c with SMTP id af79cd13be357-8e4c989a2bemr153661585a.1.1776240316084;
        Wed, 15 Apr 2026 01:05:16 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6723800060fsm186930a12.24.2026.04.15.01.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 01:05:14 -0700 (PDT)
Message-ID: <f3c9aac0-7260-4f9c-84eb-46d18da60a67@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 10:05:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco: add GDSP fastrpc-compute-cb
 nodes
To: ekansh.gupta@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, srinivas.kandagatla@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260415-monacogdsp-v1-1-077ded36c7fc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415-monacogdsp-v1-1-077ded36c7fc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QyCJnA6H_DzrxOmZ79ePtvi6qMpH7l8z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA3MiBTYWx0ZWRfXwOm4TnQGNCuR
 oPIZt3wPc1/pvR56QEtSn7nosbOtGLKZMWqBXo5agPeVyU7kakkafdGeern5gFdHwnbB9z/VwGn
 t5+IsfXVlWN0UfwG3MGl/qXevB3PwdX8S3S9JmhJ1Ys8WUK6VKUNuYW4yVht7mleE0nDGpSSZxy
 37VP9IFhYvBkrgEzPNPaZjwCoX5H6bBtv6fSwmhYQWSLkOjdufjSP8ZCL0EAbbaJ9LtRw3v5P5u
 E0huUyI4wS/Ot5cRyRtq/IoSATiNJnNjBxAox55E8y3gOGOGj+xF8H7Q4ZdCQkZ85PfAfUHgkbC
 Ufi86eFHCQpMVt0yY3S8ewzzlwDMaN2Pwp20hU6PSCvWQSQ7V9xbka1yDrLJNM6nIEoOCbLgMVf
 YqhDFK3RAviXa23l6J7iNF+79jqCXCUVdHJj5uut/5UCS7RoYxw1B5r2HCY3A5nTwusbhHHyQ/h
 /WcqzxfZbjHzys2uA6A==
X-Authority-Analysis: v=2.4 cv=CoGPtH4D c=1 sm=1 tr=0 ts=69df46bd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5opoGVv8txePf2wcr4MA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: QyCJnA6H_DzrxOmZ79ePtvi6qMpH7l8z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150072
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-103242-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 930F4401ADA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/15/26 8:40 AM, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Add GDSP fastrpc compute-cb nodes for monaco SoC.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

