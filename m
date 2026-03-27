Return-Path: <linux-arm-msm+bounces-100487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFZVHZAJx2kyRwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 23:49:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F5434C22F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 23:49:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D16F4300E3B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 22:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489F6382371;
	Fri, 27 Mar 2026 22:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPeJjtd2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e6CxWZun"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1859E36EAB9
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 22:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774651715; cv=pass; b=Sr25MfTkjH/riMFRgJC/b0Mx+ws7YpRIO/OmrqjUVEAUCMn0JeboATK+KNjgfOAi+zaytr1BqoFhIOQENg9WMoUxPPL86Dojd6i9WCOTYtGajh4fz3+eHmb4iIs3QnndOgST8DwoZy/f2lKrwR8YPJjdJ37+HcNIw6ShWztjMeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774651715; c=relaxed/simple;
	bh=O1NKOiweRJjnjoPU1WxUJ2OHjCKtZyFHqNZw59QAu6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hG7lRJwqtZjSh7JBxmIJMKwGdoLLUcpmrgWGTzuTWM5l7g7gPzyNqDGImJEPFHDrVSyraLhEgJgoLhdfaVsYGN44v2JXgjP+OCFEAWC+gn2x/S0I9XPhUDddgSjPpD6E2OzGVFo3FtBmBBfbTkz8Ldxmtqr5Ct1S+QR0xsJ72cM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPeJjtd2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e6CxWZun; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RLgN95306970
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 22:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a5gVcMuDsUAZsGbjud51wuG/3Pd9PqWHlN4ImA480V4=; b=PPeJjtd2pfiqnLS/
	Jq8Nna4aXwsTQmqjKuGssdXhoIxVexBOzodyMJqJltnCu63kUZIZLdBaMR37lMn9
	4JphGMOQ/U9bW0W5CKNH48pPX6+SF3qCfE/Ci2Q5L+c/uLVy3Zq4z2GGA8x6X784
	v9Rxl1SI1s24VDZ/q7PzOD7A90lLWOpMzrV9Vf+kyJYeLyBzY484Ywg0VWfIDk11
	anj27futnyjEyJnqdyBlMPlXCTa7cNoYwv4aTxItJJGYv+R25W9R4fTO456jpG5B
	J5Ao+vPRDjtj99C1pfRmfOFt7WnxA6idSDbe2HpKHCFt9nHpuyqjaFImEz4TuBPv
	3/cE5w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5v6b1caq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 22:48:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89ce2a7fef6so7928516d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774651712; cv=none;
        d=google.com; s=arc-20240605;
        b=gLvWgfoUV/s8P6OK3mOesDdV9ADCx4gHQIdKD3TNLkbSB6u5c3OktzsD73+Vk9L5k5
         rGERBmSGyQP+3BWTjNV3V9UT3fkzxFEakxmAN1I/5OK31pyQ4bNPHP0kOO47YEpH8stS
         i98p3Ls3Xi8o0WMlWzcrdeqBz7tLljyYwxHjKaCaSswu4a248dhvQdAYCtWWL64n/Jzu
         td8RVsr2iMHAHtCs35EgEcDSGWMw9ncncU/GJsNi7i2v0E3ad2Kiin0TLyd7/5xmxayT
         a4XrR6BxE3nNB7sYSm2xCRjwwqwJNXecvKnP0a/bRMNC6OSM90I9LbnQqGKq80JhvoDY
         NyRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a5gVcMuDsUAZsGbjud51wuG/3Pd9PqWHlN4ImA480V4=;
        fh=DWkjxHFo6v/u9Tkr9Z085XmAX7Rfq9G/by3w+tM0BC8=;
        b=G+V9XuPXVaJIm91MJd1FivAGRQ3WQG4LHq/tC4CnfWRfQ2vp4yoTvLMUD/fQOPuO0z
         VUurSjGfkOQnmdP+TXl0/ZSLzp9jDjuI48mJXIuzh8q3yyb4iEWGSS4VASeHjT9ub4Td
         D9sCdMbG/8LWiEIWBTJ9rEBG3b82U2/ZTo1kw/CBUEWMAwbF/AEdS8sqmix53Mn5rlRo
         v7RygdmvSA1j56Am3oCq9mEFPop5HGlqjfLAxFdS6c3hxu3MM+xLX/b3kEnSZdROVf+/
         YM86I5w1K9DC2IttsmX1l4bh/4Lvx93BWIKMu0iOudsp9Yi2swtCFXgxNGi0+IFk7Y/E
         c6FQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774651712; x=1775256512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5gVcMuDsUAZsGbjud51wuG/3Pd9PqWHlN4ImA480V4=;
        b=e6CxWZunAMu4cjBsPAxiiGxsTFNQ/T/GSaR90nJhdbmnImlnw1xg/OPWjWyuQP6lSA
         ttmn5XVJFqiIBMzyGZcPvUO2nEwuoFkPsvgOSuvVMXaxYY2lkzg3DBYt4b2phO5W7EOB
         wI4iKbGVzxXJzXc6XzBVgCjSBWBzJoXTyRnZs9qy3usvfbCD2ckSIZZD/9xUQtb3NPHr
         meGHsbth2v1+QhLgKsxwqPUetSqBLTNFbbMKOMRkUR67wA1iLW16MXYgUaHSpjiyRwUx
         lb/4j2ZjIb5kC8t8TLhKDl0cS5uB7Ll5eVmZ2uMZRBdNiLs0dpfpaPbhDXyb+kNiKS/J
         kD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774651712; x=1775256512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a5gVcMuDsUAZsGbjud51wuG/3Pd9PqWHlN4ImA480V4=;
        b=GvloxUuoAydoLv6N6kHZ6ioJdaKJWUju9tOIi/bCG8kp0R9xnUira1Uqwrxsfj2ydV
         UaWc5CtEiGQdal/ZVcQIES905RUBjTvz0kxwEDYskJ+K4UaXiYCAA2Lln2c7gEUSpZ+r
         JVclKCoUcozNPTAjsE9eQQsR2p5AW3zlEuEXGBscEbysh/bi8gjGNzTEqBHSfArPIIiD
         blKOiSl7RBod58rS6z+wAzDKxNe4ZUmWDdlcKnZKTKRMUR7qBluxoC4xHQ43sUFKjn+E
         lupuui6MFZXx8g2Xe5vQGEbiJ/hBcKBdMEQJe8HjPjJ+n8O2Ac4yvvitH/3lb9IBo+VG
         ZOVA==
X-Forwarded-Encrypted: i=1; AJvYcCWujUTek8/5ZuJ23+pAv8+rFXT4rKYgT9FFGDxSQhJyY40HB2VhnhxIGaqIJuI0qWV1jq6wb9GqpMOjDZly@vger.kernel.org
X-Gm-Message-State: AOJu0YwKJo8cCHupEP8QRoNDrEWkHbfYIOoZ2wpO1aXjcTwe0E6gzeBa
	MHx2qxwZmqVwgJaO4/MBG2KsSCIPDV9b+zRhpuxAaxZRvasSPC+vC7cdiixbpbxozz80LwE+yeN
	iZj0yYpsqiqsATChXbV0BreGSOagjIF8P5MaT1E0/I8Cn3U1vox+Ez21Ny1oaXNp97LoQC5b3eU
	joPnz/NSsEDDaE3Jp/PCcv9fcV7vN+n2Icuhw0m2Qd2yU=
X-Gm-Gg: ATEYQzzNORrL9HfrA8N1K4tfPxPAUBGfbs0tr5sgSQ2PsAIM43d5HffoVtnfNDaJDj6
	zU+etX7evPYfKmsyIopiQVlbnuMjgeE0D+yq9GcJ4LwWmMFFe+w3+yN1zHn59g0YXV4AN1QrCDE
	u2xCO4mbobhPiApQHFXJKrHyyF0GzVBQH6qIOGt7XMptcakyWizxUSErqwxiA2OtpWnaTyoqUdY
	hajXhcOJZeIS/FXGyL4lW3ZpeaA3pbIASIdvjDlRVNGVkt9U9ljJFb+UVvcdS1QQNBv
X-Received: by 2002:ad4:4ee9:0:b0:89a:126a:5b7d with SMTP id 6a1803df08f44-89ce8d5833fmr56319676d6.2.1774651712357;
        Fri, 27 Mar 2026 15:48:32 -0700 (PDT)
X-Received: by 2002:ad4:4ee9:0:b0:89a:126a:5b7d with SMTP id
 6a1803df08f44-89ce8d5833fmr56319316d6.2.1774651711923; Fri, 27 Mar 2026
 15:48:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
 <CAFEp6-2s=N9=Z5A3gZZYo+XErBT=gMRHdxB7EQV71wPd3UqYrg@mail.gmail.com>
 <b7hndy63j2foc5iuly4reaunaorvg5asfgeza5ptjytaghc772@6jxgnimkcvx6> <7757b121-da4f-4157-93c9-4ba162b2696f@linaro.org>
In-Reply-To: <7757b121-da4f-4157-93c9-4ba162b2696f@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 23:48:21 +0100
X-Gm-Features: AQROBzAMm1yN1rLAJcaNHZgHlMfTEGzX94B2QA3fXAqRa4WXjkjCipnSkkRQp1k
Message-ID: <CAFEp6-0og=MJm-kZmTdTka7per6eHvfO8pR1k87NwGT0no-Ncg@mail.gmail.com>
Subject: Re: [PATCH v11 4/7] media: qcom: camss: Add support to populate sub-devices
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 1-ht689GNfF_AaoTSuDr2Uy_xUEfqW5f
X-Proofpoint-ORIG-GUID: 1-ht689GNfF_AaoTSuDr2Uy_xUEfqW5f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2MCBTYWx0ZWRfX+KGKM8OkjoqA
 vk4moFEk4aIMp+hQnh/ZDjLCtdNncozwpGozmP0EvVTlhHUchNoSr1efpnitZJ6GC6hvTEmZ3oL
 m5SovMJ09v9ZqzwBRL+QmgSF9Of5WGDDoHXPzsSztTf3YJtnd8HvxGP3mY36EQz34mxGcq6d3kf
 gYmPznajaO54bc65gOQpjybZo1ThgVemlpTOFObk6QehPfiF9S65tXKc/yLBvEb0i4V7eOrJO9X
 Od571Z5tOyrbvpE2f94l74UJH6b+6mfXE381DLqa3XHtbq3b55+nqoIOZOzppeR+27rruqe6Ow3
 vN/BtB5aEoW62Xpf+Bj1D3x9pTbvYBhn4C1ZxlmavoheyizLD+02FWzOxKUxCLt6gfsNQpLXfPt
 u+MtxlCU8NAgC0CDcKHKmW8+Aoa6Z5qT+v4QgWOIVJBNz+iwLWqSL696xDGG0oA8CYUnrntFbwD
 n/1vn85nTFs9Suc2t2g==
X-Authority-Analysis: v=2.4 cv=JLs2csKb c=1 sm=1 tr=0 ts=69c70941 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=XwtK2cgshX5IxEekORwA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270160
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100487-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: C5F5434C22F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 11:37=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 27/03/2026 21:33, Dmitry Baryshkov wrote:
> >> Other drivers typically call the populate function at the end of the
> >> probe function. In this case, however, it is invoked before the main
> >> resources are enabled. I assume this is because the CSIPHY device
> >> needs to be available early. Aside from that, it looks good to me.
> > This becomes fragile. The CSI PHY might be built as a module, which
> > might be loaded later.
>
> Is it any more or less fragile than "simple-mfd" in a DT though ?
> Krzysztof isn't very much in favour of simple-mfd so this method of
> population is the alternative to hand.
>
> The CSIPHY driver uses devm_of_phy_get which handles deferred probe. If
> the PHY module isn't loaded yet when CAMSS tries to get it, CAMSS gets
> -EPROBE_DEFER and retries.

What about relying on v4l2_async_nf_register() in the same way as for
the sensors? That would allow both the sensors and the CSIPHY to be
bound asynchronously when they are ready, assuming the CSIPHY driver
registers a V4L2 subdevice...

>
> >
> >> Reviewed-by: Loic Poulain<loic.poulain@oss.qualcomm.com>
> >>
> >>> @@ -4964,6 +4965,8 @@ static int camss_probe(struct platform_device *=
pdev)
> >>>          if (!camss)
> >>>                  return -ENOMEM;
> >>>
> >>> +       devm_of_platform_populate(dev);
> >>> +
> >>>          camss->res =3D of_device_get_match_data(dev);
> >>>
> >>>          atomic_set(&camss->ref_count, 0);
> > And this looks suspicious. What if drivers for submodules are already
> > there and start probing once populated? Do they have a chance to access
> > this ref_count?
>
> Nope, we don't share the camss pointer or any of the data-structures in
> the existing upstream driver with sub-modules.
>
> ---
> bod

