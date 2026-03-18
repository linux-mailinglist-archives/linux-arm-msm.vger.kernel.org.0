Return-Path: <linux-arm-msm+bounces-98406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qL2JM5iAumldXQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:38:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F852BA073
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 14B9A301116C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0D03A785C;
	Wed, 18 Mar 2026 10:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y0qEPPb4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PHBIDcCQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B21138F241
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773830289; cv=none; b=L7jsdDBYZsJt4FjL2V+iqA9dnaKgeVBoQZcptAQWAAz1gWxdmZd06RiqMSqV42X9IOzyfaaJdKY+YVSZbzQ/tC0gmOu4PuANAQ9cmxyZ6mCq/wiW69aMTEE/hzfcLP+5khhv2GPEYeCRNpU64JMP/tzNFt+WqjHEz7j81zh+mNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773830289; c=relaxed/simple;
	bh=0YDzt6V3vg6D6oJUe9WolAPbfvjBiXP3g8LYRuhBANg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKizd0I1wZ9qjLawhCMEs8Jmd5A1o3wa4qAp1MFqgTNHgG0EyHymiGsXq/1nsNvIPzHfahin4+i8owhIta21fQ15pIvEEftNQ/7eqkMd+C3iE8cqthZ75GSPyzdU4kpVd91Gbqp+q1HkORVH6KNIZmz9PZYQAhobDIwdR5UPipQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y0qEPPb4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PHBIDcCQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8mDkb1145393
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=etLB4xKMCA7FR/VKgQent8kZ
	4P8Qsk5oKtt2p/Otvk0=; b=Y0qEPPb4fT7C5+dOgTlv8KeXcG0hVONIPsNLZBig
	MMzXwE++fM+SkdbvBk+gIKrGpQi0Pyzaydf7DE65FhRI4BerpdDTlLNcjg4i3RX7
	qyCNGlONx9HBy7TL7oRBaQaFM+zXX3nPNnL1vQRmKlGkJCM/N26Vo//imDhlkXYU
	BXczwT2YbUqr1d3bgvFWnKb1Xh5xX52kNqVvxbLewGOqHg86Luxu0arjurdINZ0Q
	a06q7I3rN2tlFDPHLobDGK7POeoRYQymkv0R9pd8uijYfEYAUC2LgDZ1+JuHcGxu
	Y7+qcBbAOwjZUqQebEfbUAuAUJeZcpJb+joPvL9R7K4Pvw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyak3uu03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:38:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50921f7da6dso14150221cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 03:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773830286; x=1774435086; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=etLB4xKMCA7FR/VKgQent8kZ4P8Qsk5oKtt2p/Otvk0=;
        b=PHBIDcCQ/UYH9ktbHlmaHAQDJ15kBz6c6yTNuBKq4OY94bRPw72GsA9SluUalDkbMX
         bemzFpEozndFPTtL30kAd/wup4OL8S9dioEMnV7thGT4ewFxHyz7f5LASE8aOxZtYTHy
         hzGBL8CqJqbYRhZ//0lPOh7Mp/Xb4Rr6kT3Ul39i5zww7ebxKYyjwj1+H/JgsEj2hlAg
         Pbx3+xTnhOpm8JAsyIePEX0K37HgmEg7I7dkKrUtIjFk27f+XIRUykeWc/khdlec9/2G
         o8BnPpSS1j0UhE3oLEuLL0XGvnejhSH+Yi4N5gdQ7zI+FOxQUW41UBCOEx4CkPl9+Bt0
         2iLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773830286; x=1774435086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etLB4xKMCA7FR/VKgQent8kZ4P8Qsk5oKtt2p/Otvk0=;
        b=heyn/3FPGtVkZGu6/6gFXxQrfNUof49opBWatH5+7+8R19+KE35BRgRrmm17R5LT+1
         QlXiqc/sFlr/cqaeatIQSp2dtgZNDUcabodyUNuJW6t3PMO+czLx71u1ggPDEFp4y9Zh
         BINfgGjFRtIAxZMLwvyODz0kdA72LOZbxRX/nU2DNAuvHnTiBV/g3GbvAACbW/Q6Vr/g
         Lp+5/l+VoYIu3zge+3giNhtKj0D4vdra11b0gjYK2mw+3anxecSnFAhxNJqN+xZkVJrG
         HAC/2H0W3j4w2XBUO4CipAi9p4TWlIyX6Uz9XvlE+iKW6yRiWkCO+w/ubnKEbVziZleP
         KjxA==
X-Forwarded-Encrypted: i=1; AJvYcCUNiP/2EdhpTgPpyF+2sqJZF87nSMOzdGCAeEjJjDvxpTTclzaJBt4bRMT4E5QZ3wWUgMMEm+qxAFvgmWRN@vger.kernel.org
X-Gm-Message-State: AOJu0YzXpMjnAclCeYZSXJtyVsSfcxKFUDDkkdWTF0T3+LLbhyYaaC72
	9KjdidBXNKkjmdUpzvt+Z8Bdex8c//4VMBfOirPXjX/WSJBkFCDIqcpD/BJgIi7i1Kn+TyyDDtb
	Dla24dUcPmAOPmGkCeNBm6hs14RcNQbKaamaSO8AonHm5cMH0bF2jmrRUaJuqvHW9faA0
X-Gm-Gg: ATEYQzzLtozMOGL+ZDYcnMCC2aTrvi8G5yNluXYHWMozbgD8MmXJwQjUMamaBvKwlL5
	NbdqLmYU+zo/ax3gNg+FO+3+HQ7hV++jMK5IbMyTNAALPq0VfDAojTuU9eaaa4+GNQoFA/JkLWL
	lYTJRv1O8t7puyY1UTThuNi/yCgBYMz9nkt8p2brJBhhjFGZUCwPb0is7v3plT5zc4/3+zVdsv0
	k/0leEpKC+k2Rrd51g/Y/NSN9u3W6PYqFMCigf8v3rfsCnSKrckMjMWzV4+3oiiq3MU81KoGqEZ
	jHnQcyG0VoEltkSD4+JWx4zeR4NbJQnFhPNe1A4y2GKa4p7MFMaNDRFthQ4WTFcQgQm/CLJLQtX
	s5+6NbHvKK8FZi+ZgdGbythFt7jbIAh2DrMOPH458Vcni1qY8umJsY62DsIAz/VnOOJQfKGlYZg
	m2alsy+7yhf/nycwdalr9ayG73nYvz149HZq4=
X-Received: by 2002:a05:622a:314:b0:506:a22b:fe56 with SMTP id d75a77b69052e-50b14886c64mr31210261cf.49.1773830286423;
        Wed, 18 Mar 2026 03:38:06 -0700 (PDT)
X-Received: by 2002:a05:622a:314:b0:506:a22b:fe56 with SMTP id d75a77b69052e-50b14886c64mr31210011cf.49.1773830285927;
        Wed, 18 Mar 2026 03:38:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c79442sm447034e87.70.2026.03.18.03.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 03:38:04 -0700 (PDT)
Date: Wed, 18 Mar 2026 12:38:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: Re: [PATCH 1/5] arm64: dts: qcom: x1e80100: Remove interconnect from
 SCM device
Message-ID: <6kywpew2ttav7enc6euwbmn4jjx7mx2vpm5v3fjvey4tti5bbs@xhspy47zyto4>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-1-760c8593ce50@oss.qualcomm.com>
 <bnaxwhrfeer3n62xp5rka4pq4mz6y5xxwsin2vavc5zcj3ymxj@splrj22ki445>
 <198ccf60-a4b9-438b-ad92-bc4d2cc84b83@oss.qualcomm.com>
 <90b3a7df-cd02-4878-b614-1499589f0906@oss.qualcomm.com>
 <uukjr4c2uymzj2pe544hn2w5ecpmqle56mir642zieip4ixwor@3uuhplnfo5qt>
 <822cc610-7984-4684-99d3-8abd679eb06d@oss.qualcomm.com>
 <jup7h7tyf4efv25mqj2sz4jmztpqbng3jgk4dvz33ec66wj4dr@kgmp5g5pnbon>
 <e874bfce-1cb1-4b81-8d05-557f061904f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e874bfce-1cb1-4b81-8d05-557f061904f7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=A7Zh/qWG c=1 sm=1 tr=0 ts=69ba808f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=IX17Rdq6gEsNXp8UFyAA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: hAA3nxEm8w_X35Gfl1xHq997QiVCwZjQ
X-Proofpoint-ORIG-GUID: hAA3nxEm8w_X35Gfl1xHq997QiVCwZjQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4OSBTYWx0ZWRfX5AJijUuOicNK
 cHCVGNAEwYPBw9QXQGeTvQJjdi225ZO3nVHpIqvHmE8ep8Vtfhj6fn9Ey/VvvlEPFq0awheSpqt
 dJqbNY3n9udMPAblDsd+oAPQPA2dnbOgFGrOHdi9f5yjL0SSXLRwh7/QDjbHTzrlmUhCwOKYqma
 +Wl4CqcIzewer5H6oby2DLtSfElgZaExi8iwNbOCkSfYtQ6h5Cw4tjGQV5eKw2wFLn8c07kUZkw
 byCcDosYvsAZWisR8yWuGnkCU67alvKTrLEIOYZCKr/WXBLA5qYZlof1CQWxXhBXM7r5CaXshQ8
 H69NwDg/V8rJeKaVlPeoY+iZUZ8NBJgCFNAYaPoiTrrePFvTSBTWruRNN0Jx+6iCY39l+OpaoP9
 1rMuyY6E9DRn0fdHV64RRqHrtdoZS7KPXG/3heKCZ/j+LyzEb9GidVkEncjAeCbuzMeW8SazbKS
 LMRrvE0RdrD3tgJnTNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180089
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98406-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 77F852BA073
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 10:33:28AM +0100, Konrad Dybcio wrote:
> On 3/16/26 3:25 PM, Dmitry Baryshkov wrote:
> > On Mon, Mar 16, 2026 at 10:39:09AM +0100, Konrad Dybcio wrote:
> >> On 3/13/26 3:48 PM, Dmitry Baryshkov wrote:
> >>> On Fri, Mar 13, 2026 at 12:59:46PM +0100, Konrad Dybcio wrote:
> >>>> On 3/13/26 11:12 AM, Maulik Shah (mkshah) wrote:
> >>>>> On 3/13/2026 7:41 AM, Dmitry Baryshkov wrote:
> >>>>>> On Thu, Mar 12, 2026 at 09:26:35PM +0530, Maulik Shah wrote:
> >>>>
> >>>>> d) Add separate SCM child device (with interconnects) under SoC.
> >>>>
> >>>> We'd then have to probe it as an aux device or something, which would
> >>>> either delay the probing of SCM, or introduce the need to ping-pong for
> >>>> PAS availability between the API provider and consumer, since some calls
> >>>> work perfectly fine without the ICC path, while others could really use
> >>>> it
> >>>
> >>> qcom_scm_pas_is_available() ?
> >>
> >> This comes back to either having to wait for the interconnect provider
> >> anyway, or allowing the ICC-enhanced calls to take place before they that
> >> happens, stripping us of the benefits.
> > 
> > Yes. However this way only the PAS users will have to wait (i.e.
> > remoteprocs, venus, IPA, etc.). All the basic providers would be able to
> > probe.
> 
> Do you then envision a separate qcom_scm_pil_is_available()?

Which calls would it guard?

> 
> Konrad

-- 
With best wishes
Dmitry

