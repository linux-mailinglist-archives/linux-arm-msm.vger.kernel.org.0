Return-Path: <linux-arm-msm+bounces-99319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPYVEYhdwWlZSgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:34:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2572F67D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:34:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 896A6341AED1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438763B6C0A;
	Mon, 23 Mar 2026 15:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3K7cxPe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OTUjna6U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E983BC687
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774278425; cv=none; b=bsZsuSTySvJfriDBfNhlLvJ+6b0uSnjKk3kS4r9XFv6ad2OGDJf4TveKeLq/Fhf/jsC3oy5W53xCL+e9fmgwSaAMLsvXLkoi/JMzSGytLQgum7Sni6M+GRvqjUxXSwV05r79p5kYjv6meWRlNwPqnLtXbkhfMHVsnGFtDoNgL2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774278425; c=relaxed/simple;
	bh=vWfLZulYF98bbONuCI6H4gbtLYhlwHzI2I0yFc/vPEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KqFMjvsqShjXitBOCUw9IGpwtOi+mR134WAKRZZ1WQ5HFzrPiaWHiZwGOkic6vOL3d2Rf70WZLCpUiWLq5WxOZz1X5IuAaiua5xOuwLjI3jgwVJY3jfTKgQ0L4JYJGDsc3Jd49DSOmDq4xtcLYuda2Po/aVVi6nWnVJekOkJHFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3K7cxPe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OTUjna6U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NDZnVc3468428
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uI6pvx4mLZDASpyKDCFK5aLbfXSRJ4d0KyNwYp6ZJPM=; b=C3K7cxPeJCD3Zrme
	ae37zx9TXSitQ0nY1zjkU7AMZzkjOp1n3J37UkEIuV053Umq4LmRD+BJr3gr57bz
	EEjCDdpDEZn62QCufrg6qvHzvTw6Jv7qk2wwW9OWKgE3EoGNmvKOoDSbKSGbhmr0
	vtkl82qfxb/WVVYlVScpze01konGKliOGIQ0yQ7ZMW9CdKELlKGLwPzrGfiW65Q3
	4kS+SSmetGGzjls7feMEM6epROvoNRjpV2t/H+xxJx9C57eQ7WdCIOr5uZTEysj7
	xWhRDn52JX3a3CPSAzMm+6QDlj3J7ddTXzBkZD/9m4dbTtm6LycWz0IV5XNHpM+B
	G+cLaA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jghk4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:07:03 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ff04e26bd9so484496137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774278422; x=1774883222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uI6pvx4mLZDASpyKDCFK5aLbfXSRJ4d0KyNwYp6ZJPM=;
        b=OTUjna6UxWYpiq1DpTLaP2js1fi2JOORfCJ2qQAavpAKqKeo4UaW06SGfSbwDeMfTH
         3oYgP8SghXYNxc/14LwtjSFaGmk5VHYjBtbh2JoJ79XzrPfnijsHKZzvq9d13mMFVvdm
         UoXvGy7ZG+3ce3xcxsn3dcxs/A0oIGIiz/h6lRRkAmsTzLVUUZMCdudpfJ/g5Dt+Pxfy
         mcP9awZC39mhFdHPuirqjPpONFOTxv0K66s+NiWd8m1gkotvAm/5MYfK8jVbKMxJcq1w
         +i8+Mo36sdCpqOevd62j8ymIqG3uke2SFad3EdRpSLcKNedv3btFDyCCNv7eNbR8hEZN
         mq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774278422; x=1774883222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uI6pvx4mLZDASpyKDCFK5aLbfXSRJ4d0KyNwYp6ZJPM=;
        b=MHM4Wm+fvhFaOTxh85a2rar8YDz7hQg+MuD0VDOFPPFACkP8OTBWrkKltcVd9E9BXC
         S4/Y0MjgTsTAX+gEAJ4PBX57jQlek9NoZkv31I07dYwFB0ciCS9oIWxzjN+ZfgA1H3DY
         bQ/4MvNNf88yMZmTj48PLfRyo+lJ9rU0RzCFe5pXi00G8krMX33W/XNrqk/86LnMlAQk
         sLxjhRgqByfRJFr8aGGXMy/SFKTBsOezkHToAh0ZuC0KKgFQJ1OwUM3AdPcCOnsD/ckt
         dVm9cDDJkh8fJ9fo/8wJMD4ymS3+q3A8eNeFn1mP29oDbFN9qO3fBziYVF7hBmYwUmh/
         YUMg==
X-Forwarded-Encrypted: i=1; AJvYcCVv/spEmvdHsSki3lsr65NH7qE7X8Gxbr8BmhR7f0QgJmH74hZlUfi9hCOCa1RL7yCEYte3g4Zwr0Jq36jZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzjhA+nAm/+0SThd5xRkwR6oS9J/qBe9T9cN36mAFEy2gG5HfXa
	GluDBqqwDO00UzY0o+ih1RHIL0kn1pdLEl/B3hmlG0NZTghIBOnTLKdFQcXkm2A2SqvYMqsE5NV
	byD8n+qHXBia3zi1YqVmZ/HnuTj/H2IK1Lu5G/LLLn+1il2R+S6kYuOrrV0gJ1BY7G4hu
X-Gm-Gg: ATEYQzyS35KCGNWVr63n+jpRRtsu7ANBnXCp/UzN0tU+r1A1yVeAlQMdFaMIXzAdeo0
	630Y9VU2/r/md4omT30n1kx8Yc7Hsk7rHCZZ7aiic6gJba0n5lL9zoC3aGT/p8JdKe24qw6Sgrv
	JujPU6I5RRrPZOmt0uSQWLYxqHyrQLP+/hhPlW6OH+eyWJqRcIKRKDQUDQS1kcb075SKYKtBV0u
	eSyzUB1F7O6c7D2OtdvOSM7kKif6QappJ8KdpluEZlaSBoNA2ZJRb6Of1pTwKs0xnn5T3Tm13O8
	ddOtyxqi9EgcLcLN+GELX2ks6pdwr2K572yOsimSEyzurAoDvWJGLH2+zSFaVplrgU59GEpifnq
	J7KgC7hPCEsUWNAsp2EA3f74IAOid7tZft5SlGzUZol/HLlm6VQfOj79TyZ2wtKjHhYDINavUr+
	6qXuc=
X-Received: by 2002:a05:6122:8701:b0:56b:8426:b00f with SMTP id 71dfb90a1353d-56cde31dcb2mr1912658e0c.1.1774278422146;
        Mon, 23 Mar 2026 08:07:02 -0700 (PDT)
X-Received: by 2002:a05:6122:8701:b0:56b:8426:b00f with SMTP id 71dfb90a1353d-56cde31dcb2mr1912372e0c.1.1774278416834;
        Mon, 23 Mar 2026 08:06:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43c3bsm502731266b.2.2026.03.23.08.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 08:06:55 -0700 (PDT)
Message-ID: <0ed387b7-c4ed-41e7-bccb-eb1a96064c69@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:06:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: enable
 onboard accelerometers
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, laurentiu.tudor1@dell.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260228-dell-xps-9345-accel-v1-1-daf9e3b3b5ee@vinarskis.com>
 <630bcc07-5290-4099-bdf3-b7e37105619f@oss.qualcomm.com>
 <kFzSXZV8ReVKN_rvfVDZw9pOzHeLI1ia9bepKas6qG-7G4WiRKk1RcvEhMnPrKrFDvRzLMUSIZgnDY5oerb7kdSBreCjnxJEdPZG9iyYp9o=@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <kFzSXZV8ReVKN_rvfVDZw9pOzHeLI1ia9bepKas6qG-7G4WiRKk1RcvEhMnPrKrFDvRzLMUSIZgnDY5oerb7kdSBreCjnxJEdPZG9iyYp9o=@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Emw_kCMbGhkKhOF29E2erDNeYpKWwkgR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExNiBTYWx0ZWRfX7ZMPcZURtf7b
 DjQn8JFReYrGLIWzOWFhh9f/KaOp6TSf7i+w8T3wS2HSnNoi+Z9g3RrVOYROghEvykjOuktzhVB
 MM/EEl6m78nkxSkL2UKQYoQ24ceWgxyj1KrqlmLUvIvN9uux7L9y9/5swS5wH4epmpZhWYYpG2X
 ZbMt93mU3refCWqIG7swhqt7TN/g4SEDgG7UCizzsIYT9foycy7OGdsVYhP+uOpWkjfUhD6Va5C
 l7nIeINDQUZ+doJcGsNgfxxilXJAGtagJxbtHFQMfPnEnXK2sCogZ9gMSlMQGSDpHPBqfhDI94Z
 9cJDFzTFjQRyojZjnrCvLqXthgkU7U0fb9w8cWxi2ORNGwhtcv7y0vs6vVjBFUf0EZlss+bWCY+
 40uoAn5srqHmb6wE/yaEzD/S6c8XADPFMlVPufFClynz+GkG1IYkEsQxmwWyc04kZVYa05mNQFZ
 mwJkZv+gd2pAHkXNq9A==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c15717 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=vwHDffmn88hdHWJo-3oA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: Emw_kCMbGhkKhOF29E2erDNeYpKWwkgR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230116
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99319-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AE2572F67D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/2/26 2:25 PM, Aleksandrs Vinarskis wrote:
> 
> On Monday, March 2nd, 2026 at 13:14, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 2/28/26 6:46 PM, Aleksandrs Vinarskis wrote:
>>> Particular laptop comes with two sets of sensors:
>>> 1. Motherboard: accelerometer
>>> 2. Display/Camera module: accelerometer, ambient ligth (and more)
>>>    sensor
>>>
>>> Define both i2c busses (bitbanged), sensors and respective rotation
>>> matrices.
>>
>> These GPIOs correspond to ADSP/SSC-bound QUPs. It may be that you're
>> poking at the same bus as the DSP is, concurrently.
> 
> Indeed, Val already pointed out that there is hexagonrpcd to access
> sensors behind Sensor Core from DSP. I found corresponding .json sensor
> files in Windows for all x3 sensors, but could not make it work yet.
> 
> Without these additional things in userspace it does not cause any
> conflicts: I've been using this for a week now, no i2c communication
> issues and device orientation information is present.
> 
> The question is then if we want to keep this series which ignores DSP
> capabilities with the advantage that it will work for everyone with
> the new kernel vs doing it 'correct' way over DSP which requires
> additional json (and binary blobs?) and userpsace configuration,
> meaning that most users will never have these sensors?

I don't know what's the endgame for sensors. Maybe +Dmitry knows whether
there's any action on that point.

Going through the DSP allows you to keep aggregating the data at close
to no power cost (""low power island""), notably without waking up the
CPUs if there's no other work. That, plus I'm somewhat skeptical about
going behind its back, since it may be that a firmware update or some
other trigger makes it start trying to communicate with them.

But I'm not 100% against this either

Konrad

