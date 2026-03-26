Return-Path: <linux-arm-msm+bounces-100037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENFYOZzaxGkq4gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 08:05:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5707033030D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 08:05:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0BED3301BDCA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 07:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B223937A4AB;
	Thu, 26 Mar 2026 07:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OYqhxSCA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DXMBPdOS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588A634D4D6
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 07:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774508678; cv=pass; b=bWr0WzAv9VyCrupVAR42uIazYEfsBRhh7JufMQ6VXVtuURi8Kdlzwxw4aFMDimndxfJsyuosiHpz7zCCWOcw2250PBK/hNOk+TVFlmDtO24m7TbzLd0M8C+H8XPfLRURKH1BUMLCMYcM+fYu6ZRVPFiGchKti3MNrix6rvya90Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774508678; c=relaxed/simple;
	bh=xi5NIAahgNef8wQN/SdnNgsW+wwbnYDjNGE/8YIg2rI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MC0EOh/RDss525eBBYdMPE6fkGN+EHAMY3G8pZgq1qN9T9FcS25hFdh2Co0mUev3pU2GaFRVmEgq57UTwShMY9RvTnxiidIOZKVTqY4xA7hVw5XF7eJuz9dIDGPIKvrVpN2OpfBFTMvZ5CLkmdsqKgZkR9/FZk9xdetg5MckL3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OYqhxSCA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DXMBPdOS; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q0lVYL3959161
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 07:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xi5NIAahgNef8wQN/SdnNgsW+wwbnYDjNGE/8YIg2rI=; b=OYqhxSCAp7T2l35L
	iae+xlTa2e9RLFYO8j/ejRRz8ydvBYN56F4AW2BrBGPrjMwgj99KZfnUiopnKw5S
	fYJJoAiQbjEMWUSsJLa1TTFKvpQ38Ehf+OZAsMb6QnWZZ/1drQs5EK0NoAb13+04
	UPoT1y0v/bDeWCNupjKv9v1DOhbvHxmhh4d6KuFlqtE4d5rFNdrREV7i+YpB49SO
	ESXnZiNG/pO1Qoz8TvLTxkNGjo41jgdnu7E1x2ZGSNOFSggh7aJAc67UaSREvw3J
	ssS7ZyuR7wpytge4Cj0AUVNkwRIkHDAbV7qKTo/6pdLtrb9a2sTMRzRawj8pbnoE
	zKdSEg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tjah0sw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 07:04:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cfc1aced6fso273038785a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 00:04:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774508676; cv=none;
        d=google.com; s=arc-20240605;
        b=Oob6KbqPbG7QhrwHqQmnSqqo8eOGL+svQDJ9K5RVF+XKR2XftB1S3Q5JqWAzGgR2SS
         OJ/2H0ive9owqqNDCr3tuF3xlQWcUDtkKye6rlwpc7IfnjKVZ+2xnMVMpQZBB1LRWJH8
         PnzXzBnwxulPMO9kYzCaqEVZdkzFQRe65d+f827o8AQ1ilVlapc82vkztK4aVRppf/XH
         4GgE754HgBJFnOoqTcMBe7fOe6DmyCzrFIjjbxnoDG44a8ecwF0cXWmG+cWLLaVH2krl
         WQaXuj6v7G6cJbBT2TQNB+F+x6jLaQfqu/Gx4Q6932FQqNELldBp/xtGLxSQqd5ri/5v
         SUmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xi5NIAahgNef8wQN/SdnNgsW+wwbnYDjNGE/8YIg2rI=;
        fh=BfoduhTql7vurS2UjigXsgBEpDbLgDXZeSv434vM7dA=;
        b=SFRFSQUzCxpM0nrLhiNUxvpziBqvpGRwa8O+t+M5ZnYZgEz+OJQCSGHj0/jZUzSkf1
         r11XFBpYmTKmXg4XKZ41N7XonxWiDVe0L94MxmQ/b18EsdbAS7yEI2mVF/cC9WJLzgpY
         lESCDyVSD1EML6ep41rXhJ5Q8/aCBYIzHxxiB4cP9Z77Lp30mcRWOonoiratQxzOVIya
         zEQUa9buKF9kLd5U/TL7hL+Gq6Af0EsDoxwHgVbhsGMMskrefqrm3dW8jbTv+vkB1Rh8
         HfdACGypCQkI9JpZUa54LEDems25N3Cc2MSgQb/ehDOruiQfQFpS7SWLLR3yLfZme/0U
         O7JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774508676; x=1775113476; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xi5NIAahgNef8wQN/SdnNgsW+wwbnYDjNGE/8YIg2rI=;
        b=DXMBPdOSRhvFBYjjnrlzxvDxM+3ZchMskrRMfg5T8TQha/3abj9sPRiQjqtETswVOe
         ICeiXTfMJsy+enUjk8f1DOxcELtiR2eGh2KkCwHZ8VyHO5nHBw34luF2u6iSGGwHs7nU
         WUxQFDh+L0DP03dBNZyeTzjQZE393PDxsgvrtscomIjiqBfyUXEg2A9qW46p2JXzVP5s
         7cTju3TUY3fS39zTJzXXp3N85c2Xuj3sV0e3cB5MPdqaWEx3sau6hDM6/rkOTLrfB/dk
         Dd+IOOajdPvN+qmY26lRd6SPJrA6RDLJgBudAWZsiMiXI/B0o6xaKYt25PMh0q/A+iVM
         s5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774508676; x=1775113476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xi5NIAahgNef8wQN/SdnNgsW+wwbnYDjNGE/8YIg2rI=;
        b=ZE6Pl+CvgI7d677fnUZy8XsrAgJQhT1lRNIEXbooTOKvN4bbAVwMmkU0lGfnLH03yc
         FA396fQQT2g9HJsn4VGhrZbiSKTx57dpUrot3ZfGJo1GYeXoFR9ntlfPk1rZ1XfFddYJ
         JgPPJvSUYxdiyieyhBUAeqaOJiMiaaddsmHqndoWDzMM3b1JzCWhQVjI4pCQ+IaIgRY2
         t4gNjvgeAO76AhG6+2s7ZFI4O6Cbd4XLBW2bHuRoVLAd2aSeV6AeMqqcFs3YyivFmO1F
         00v2gTNJNizxWV7d9ENxNuN3O1mqIqwrG2BsqhZ9pMeMG95WUQFJj/fRY3kRk2WqYFCT
         WxVA==
X-Forwarded-Encrypted: i=1; AJvYcCWMVtLay8Ztqi8b/eWBWHvLTYNxwmzZ7o6KtHtCmWUGpOEzFVyO17UuhFTO844Vi0tnNMwPpajfniS4dkT2@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ38O8MPdAGxdpwxOBTwW7T2BPQop0YOJCQFtBckiFAlhLAILn
	NRsmcidELXoLGRn8U8++CYovGC7aq6Pv6pGP4CQsMI34ZH5AVdczw2RXQoEdpAOtPf7ez2SeFM1
	H7hMCWjXoVe/j+5lVaYPocGIsn0wkf38DUkEnB/Kj1c/CpwdO8JzEASo4z3EMyCFe1KdiikBn4J
	Bnl6Ktl0452ep7OkvQLDeQM3s4Hh79FM32+oD51L1Amm4=
X-Gm-Gg: ATEYQzz3WD0B+6XLI/oWYi8OTcSWPkhjUU3tAnNjFulwAj4ZLUyuSvRUMX5QgXzC0TD
	FnwT3m1ziGvG85n4EtSpJcYajRGoWM8UIWyxTH9+sC/AlCkGMClVsxkA4lk6wwwtqXNPaLNiJ1y
	CEta+lKamVYhoApLZw4/oDQsW86Vo+9LsOVmnY9/rhHsH/t0iZpxcNAqMb2On56dHDHz8bHhqdq
	2Pl3KI=
X-Received: by 2002:a05:620a:568:b0:8d0:ad0:bfee with SMTP id af79cd13be357-8d00ad0c705mr420797485a.26.1774508675555;
        Thu, 26 Mar 2026 00:04:35 -0700 (PDT)
X-Received: by 2002:a05:620a:568:b0:8d0:ad0:bfee with SMTP id
 af79cd13be357-8d00ad0c705mr420795085a.26.1774508675045; Thu, 26 Mar 2026
 00:04:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
 <20260318-neon-vigorous-prawn-dce7f3@quoll> <CAHz4bYvs9mnDwfkfjkebucZSQpugEqr6+sFf1-hgzNO8SodzQA@mail.gmail.com>
 <d44ec842-1763-4f5a-a987-f41a6e624e87@kernel.org>
In-Reply-To: <d44ec842-1763-4f5a-a987-f41a6e624e87@kernel.org>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 12:34:23 +0530
X-Gm-Features: AaiRm53LgZwRC4-dZr8TZYUTH90mg7YLcB4GfdpJtgbwdJVo8pxW4uBCJ-w86qQ
Message-ID: <CAHz4bYvG-FE2bmN+VU6jM-x-j1pLz7DdYqub+=ek0P-zgU1X2A@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] Enable secondary USB controller in host mode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: Yw6EKZtUz33UlsKeEQ7fNRFDxhStpxW1
X-Authority-Analysis: v=2.4 cv=Nr3cssdJ c=1 sm=1 tr=0 ts=69c4da84 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=q5bItssymG7qwTykz4IA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Yw6EKZtUz33UlsKeEQ7fNRFDxhStpxW1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA1MSBTYWx0ZWRfX4VzLO+7McyXj
 ridoEqCTXZFz5ivK+Ep3xIpElH8LVtlQ6QhEPP/8OI1kYQARlrSoThdxoM2VOgYNIuQsEFqB9MT
 jGhgOKtQJRgkEpX/cBwqOYUBd/jm2yauLmDwQ5W3atl3/ZT9iLU4fgLcmh2Gs09CZIKJqQUumLt
 ua/jIpk0/c7GHcZfjNLwSDdKJ+HmXcg9dLki2i9E6kELXRLGCPupK+qZqakVz8DSTpnqZo3LFmI
 N8Erz7Rird3YD1NSqKPW7006xCjymjsRwkvwEDC8nZhGnCglyrAmndm3IErErAy/z/kVMeSzqPv
 sziqVX6le+n6KmqJSDZNxCTik9ab+EZYfTLcqKMcj0cumyRjCvyxEomirZgwX+CyTVCfklHNaLD
 rF/gQgE1Kt3vxYd51wOJStgdQ70ZnkGrhzdc6A022rl/AylWrJ229vJNVIOORz9UFq+ftwI6GrO
 SsxeIMxOlDaU1zJavPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260051
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100037-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5707033030D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 1:12=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/03/2026 08:36, Swati Agarwal wrote:
> > On Wed, Mar 18, 2026 at 12:33=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>
> >> On Wed, Mar 18, 2026 at 09:36:40AM +0530, Swati Agarwal wrote:
> >>> Enable secondary USB controller in host mode.
> >>>
> >>> This patch depends on:
> >>> https://lore.kernel.org/all/20260306091355.1178333-1-swati.agarwal@os=
s.qualcomm.com/
> >>
> >> Honestly? No. Drivers cannot depend on DTS.
> > Hi Krysztof,
> >
> > Here what i meant by dependency is that I have rebase this patch
> > series over below patch series. Below patch series is related to USB2
>
> And you should not. Drivers cannot be based on DTS branch.
>
> > micro USB controller support on lemans EVK.
> > https://lore.kernel.org/all/20260306091355.1178333-1-swati.agarwal@oss.=
qualcomm.com/
> >
> > There is no dependency of drivers on DT.
> >
> >>
> >> Also, combining here USB is a no-go. Do not combine independent
> >> patchsets into one patchset.
> >>
> >> I also do not see how you addressed my comments from previous version.
> >> You never bothered to respond and I do not see them implemented.
> >
> > Apologies if i missed replying any comments.
> > Regarding your comment on v3 series below:- GL3590 hub used in lemans
> > EVK requires only 1.2V and 3.3V supplies for operation, confirmes the
> > same from our internal HW team and update the same in thereafter patch
> > sets.
> > https://lore.kernel.org/all/20251220-economic-gay-firefly-1873a9@quoll/
>
> This does not address the feedback. I did not talk about Lemans EVK. I
> don't even have its datasheet. We speak here about GL3590. I found at
> least three supplies in datasheet. Your binding has only two.

Hi Krysztof,
For HUB GL3590, there are three supplies which are VP10, VP33 and
VP12. I have already used VP12 and VP33 in bindings. VP10 i have not
mentioned since its internal supply and other two are external
supplies to hub. VP10 is internal regulator and its pins just loop
back. Regarding AVDD10 and AVDD33, so AVDD10 is internal power hub
which is routed to several pins for different functions such as the
PLL and AVDD33 is external power hub where the external 3.3V gets
connected for multiple devices.

Regards,
Swati

