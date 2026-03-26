Return-Path: <linux-arm-msm+bounces-100079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPb8DT8KxWma5wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:28:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4338333524
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:28:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C532B3184197
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B712E5B21;
	Thu, 26 Mar 2026 10:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KgY1giiH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d+LanOj2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25A3372EC8
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774519787; cv=pass; b=X/DIZYCMCVg/L8aVHX+vTN6TBgfXV+iEnjiMc/LdQMXN0s8dUb4P+nvWv/pNxZdtJdFW3I5mU37jDoLyo+ABoEx9HTWVKWPtKJgzezDreXFvLdtK+o0RNY0GkP6GVPgqIJ/zMMGvZk4ZAS75i3oAga7P//zPplzhxsYb4YohFrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774519787; c=relaxed/simple;
	bh=skgUdY/qJbcGxUR9dQOLB+4Bt5AS05s4FTctmnMSjg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WX6UkIGlfjSSacUnlaa5NU2QE+MPz191n/Gt+aLLZ24800zbxaGdbSop3p/s0y0PXcJW8kyEBctYpTNxIjYM7GGz/dK67+Wq7Neyk5mnfIx2R7ny2k0nw8kgEfenS9fB5vtr3achtg0yNF+42vhqpLXDIn+7Rtf+UVg+eLwZFBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KgY1giiH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d+LanOj2; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6Mmmm1965107
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	skgUdY/qJbcGxUR9dQOLB+4Bt5AS05s4FTctmnMSjg4=; b=KgY1giiHYXJcAZfz
	5W+R0ht2uQIeQGOBCWBu0hvRexTlAnbQ7NHX+rsmHyMPjoXi2VZYqOqp9zW8/qZy
	etutvF5bQ3Mk4lCjakh8s5pENXvAqIgcxLUbVvk5/Oez+3zq/WBije24Fk77TAxv
	HIV0PflWvxr8mYwI0aPaw0vEus08W3Vwee7kOvH0ZkAgTwm1ADU5oys0w7EK/pl1
	dRySGD/zctSw9kx+Kv6FznHDF9fpgMHtgk7feStGZKK91hmEkeko3JqKfHl86Acj
	EGeASrBQ/OpPkxFoDKK35LfQt99n5+e/La7cOJDUAvw5z7zBQoTifzyg4JoSaX3K
	NdRAdQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4pymjb3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:09:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso69171671cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 03:09:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774519785; cv=none;
        d=google.com; s=arc-20240605;
        b=jxDR8u5rYB0ODq7L9JEQn4lT+4zxMuRMUXtJR3g2dFTGts1GhChqXjc2CNp5zm8BJc
         tn5MoD7+h9jZkaXEE8R7xdOqg3y8yXddQE7g9pMoc3pM5FxwJtlS3vWV4C5tS15JFIQA
         QLmvz76vHJ81NfhUl5/CQvIskHxQPPavaKmmi72eJ4/gIlSmxo+2hwcLbuY8ylPGxg0W
         h4IyX0PfkHOK/DQ0fuW5liqN4vD+12Q7x07zlcDk5ArbbYUTSwY2KSLz7th2lT3d90my
         TzhtNR2SHUU48SiMNnq8Dcpk4jhVBoCzjb8VeVQuYWlFb7Xg1Plqd7N4n3T18vxrIYTS
         Z7lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=skgUdY/qJbcGxUR9dQOLB+4Bt5AS05s4FTctmnMSjg4=;
        fh=qy7oIkg6PHscCTI7xZqMpwc8Q9koS/4fwn+wrn5e8iU=;
        b=TAEJBoRWsWXQNgUZGLsIZQClKHmPN2DS2eMMIETv/BzstYXXpDJjzDk/SAawPr0A5B
         K0A+p579IHpvxu8qttzeml6q56PakQTF+hlqjrzKrKPFH59tGRYIwbag5riZX/BT9JWR
         kiHEzMZhP2aXRE27nQFTQ2iUHvVJfrOJHU+Cm4AIEbKztw0FTIeRMTt15wq5iKuGZyDY
         rIWCGOYLIYqPBDuflNg9FJP4i0hgAe9wu8F2vLyOH7R1+OCcRVRvgZlrEuGwLosflvOd
         p72h1biTTI0QSSSXSASOBTXUV+RfFCGSv2ktClJRaPM0AYzZKzcunhAPHyF+/0CZZtUb
         2cvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774519785; x=1775124585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skgUdY/qJbcGxUR9dQOLB+4Bt5AS05s4FTctmnMSjg4=;
        b=d+LanOj2EvrQkKlyhTB1PSSAPhdJ1LeBJzbXJji0EQMZh08pH63QsXU/2p93B0uNGT
         fCZG7NZaB5j1BnKODp8giVeVdbgHPXeo6QctGfMVifo5cqa0qjtfLTC0zYrX5SiRZ5+F
         0tQr8GTOW3L0tGQeNACsQU3C4yGyTEh5+Pr1O+rrB1XVNxbonohioXjDZLzzLsKNGeUI
         fT+TOs7MOEcvte76iOmSbYM6ppb72/dXYiEUhFTNUfPS8Pw2kyQqUPs6lzkvBTgMxsmL
         Wh0EHrozp4Kw22s1LH/DjuohOmaajsEvNbBvrWhCNu5M4BuozIU3kg6GIHurqSAMFOXu
         HEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774519785; x=1775124585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=skgUdY/qJbcGxUR9dQOLB+4Bt5AS05s4FTctmnMSjg4=;
        b=iAlCF9qekI6DD9CN/KavUXh8oNslk6I2gUexAS8+YYw+pHeA3homvOny6N+OSaM/K1
         RRfH+9bwE0IT93ZNMrViUIq04ezPziZqOhN/tyLudJXgQibSf3nxPHxaH5v30HwKCEMk
         k8GFQyLoinUEDIAsziCnPmuFFZRkwpSj2RcuU64fyJEm5mRd4BrTuGmb1cyH3xJm/lIm
         eqjK3epKA6e1rndEuY/VWn13DpRek79aHft/f/Xu4iKJE2CnHCB+sB68dx6VzASu2RYl
         cGxOMRN8MLnsMabBzNIffAzgxetOhqcBXwSC83jHImCBmzFYT8OEncrhTwX8Addi2y1T
         1iJw==
X-Forwarded-Encrypted: i=1; AJvYcCVhCHJ0vRyYzpd9FAXCH4bR1IsxvvtWioRnni4NvO/IjJNSSdi7b6gV+/Mu5BjJoFJg7LDVgcxWwh9hX/Ss@vger.kernel.org
X-Gm-Message-State: AOJu0YyqPnONKoswsCbpro9tmUfOvAbCqgix3KegEC5Izjf1xUwyXFP+
	teCmhZMEK6QwFubLpmPa83HQzNmKUzcSrttRdt/kGFDIR2LH2AgZ7EeDFtCj88esZj0cIZ1SSbS
	WAkSTqB/yWaFYEAUA7RHqi/LEesYTOat9U8Ob9zc2eVErtJa9pFUnMqqvAlDSftsqWL0Qru9VkW
	aVrChhuolrhJowOdV60Kr/MvcD9p+/j/U0UvXQlIJ8LYQ=
X-Gm-Gg: ATEYQzzRrQ5HJgQz7gAP5l5jJw/boa2JEy+1XecBi+uHxemO1B4PeRXNYa6u+qZaBjR
	878BVVKKTUQRPBxgi2axQczZXnWjevPEPfKuM+/rz2zJsrF6ihOWgR+w2VWW0qOPcqBDl7OiDNp
	6If0BIv6kwrFly+/SNo/NW7FU6LWCcj519oAD2InFI7TS/VADTGqtDb4Kui5I7Ik6Qoi1n3YaSi
	zMTzjE=
X-Received: by 2002:a05:6214:d81:b0:89c:866d:243d with SMTP id 6a1803df08f44-89cddf63383mr9216346d6.35.1774519784987;
        Thu, 26 Mar 2026 03:09:44 -0700 (PDT)
X-Received: by 2002:a05:6214:d81:b0:89c:866d:243d with SMTP id
 6a1803df08f44-89cddf63383mr9214636d6.35.1774519781777; Thu, 26 Mar 2026
 03:09:41 -0700 (PDT)
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
Date: Thu, 26 Mar 2026 15:39:30 +0530
X-Gm-Features: AQROBzCKNcMgzC1itNNe9U5zfG-CQ45Lu-HC814-XQT9cIrVkIQQGAkLeXVM0xg
Message-ID: <CAHz4bYuuhHYvmf4ZvaTrba3RAHJ6jMk9h=_DVZ2wwo-5PiaHSA@mail.gmail.com>
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
X-Proofpoint-ORIG-GUID: z1ysdY7KOkqoZXNztWICTv7IDoe5CguR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA3MCBTYWx0ZWRfXyRVgVPbAdCcu
 tV/Fc0yIDdS6VnxJZE3JcLQio+kKbrRmpMP62uvhB3X4vl7Ng1zQjlaNGzIKPleOS+VPSSlSCXm
 jT06Q3PN+2Cp9PWn9goPIX+9WvTnsdbYYGqv8foXed1tG/s86cgoEsZrT0TXPnC1YU/f5OK83CS
 VY6LZXNe7CdiFfI5R+pfQWiQhKdBBFiUU7KEvLe6H13jNsFMSE51A2T+dbFVMf0cLxTJu1mYPAr
 McX1Tlna52RRBh1d8Sl4vAUobK7MSEOjBFToj6WersSvgIPghcXDsG+Zd+Y2inhooAbWvtiH24o
 pTaIbYPmNiDbQiiX6hqzHLAM7esBJlrHToJzmWynkK0TRXw7mRciThrzjsnDYjc45Yqmhe3CRWC
 /cEbbxSXckSb76CmEYECsI9I66obO9LIhrrmFJJeiH/yNsEaDTwdB9IcheZfQ287U77zz5z85hl
 QGOCcU3bUa02Pf4V48A==
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=69c505ea cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=OjkoTXuNvuUHmlkjld8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: z1ysdY7KOkqoZXNztWICTv7IDoe5CguR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260070
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100079-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A4338333524
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
Hi Krysztof,
Sure, i will send a separate series for driver and DT.

Regards,
Swati
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
>
> Best regards,
> Krzysztof

