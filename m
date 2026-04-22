Return-Path: <linux-arm-msm+bounces-104030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8P6GIJF26GmVKgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:19:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FE3442E1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 686A130626E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 07:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12C203612E7;
	Wed, 22 Apr 2026 07:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iQdRFujT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YaEO13o2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5330436D9FE
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 07:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776842138; cv=pass; b=KxauztHVgFwR02++3BCyM/TNPIh8lv8ke6//jdbon1wLoSyoKawzPJgT4gJUVxDMhI2e7pMBq4MHMOacrcBBAKbYUCeebTYrIhRbB/pLXwqAXHhO8BQUWfCFC7H81utb2eWJem5HKABx27KaDDruVZJE3X+ZuRGU5mIYCaf8L9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776842138; c=relaxed/simple;
	bh=BjK342+jXLLnJrTyNEfczF14UMtW71vDIqGbO0K00NM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XJzdJhkskvJl3TVpEuMvm3kYKLYIovQXjom91dTRJKnrVGwHVptz3lRdyEchsyVdESQubCUS9VAYF7m1puQtQRrHW3FibWIDbP+0QV0TeUVqSITTrK2EyM8n77gb6JVtVYiJiEyLyqVtfgxk8ADPBWwYdr+QaJXiUvYM1B3/iCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iQdRFujT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YaEO13o2; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5TZc1164449
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 07:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KIZhas4bXMR42PNEvpT7xTUpWExbob++Lrqpk2z4bNI=; b=iQdRFujTfM/P/LNZ
	JIpgabpOv5WJZ3MC6rU+QFjwJG51uGjMPQ0/v+tYbZSy4J2TsZx/HaDmWawwUjec
	C1/XPuV6xS8m1r5jLFw4rLMN19qSEexfcx4xdvJ/sR2Ajn2x++H34FcNA4Y7BZ/d
	V8mmy5QMywVJ6QO2Ug9YSbll4nUq56Ih8JjMaGb3cExJPUY3a/NRTTsgl3nEAH+7
	iAdqG/2BtuL9BHna4O0smOqZXuLaG+ewab3K00ip68RFN/XrP79rEsqjXFQ/z1wo
	95bjV1eExBF/PDAYBFgm/Uio3ROwijnZNz0303dfwqVmEto9BN8zqBpGoXRDLqBH
	c2QB7w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenhj477-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 07:15:35 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ac9609d3d6so134498656d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:15:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776842134; cv=none;
        d=google.com; s=arc-20240605;
        b=SRIAsJMRK638LqC62oOE8dnrOUtkpm+LF7OSGe3OWOB5OaBGsxFVFYqFrrnD2Ydggq
         PhBMOtFY9S/j/GfS9f3+3b1irCKFgiBUcBZDreQ3emiXlcr2EmQZQbODoyOCTtkRMAuZ
         gQbsGaMxbfpq45jZqSLLe2gLjYWUHhRDgembI3aorkSFaMXa0dWg08NLqGSzU4lPfBit
         QTfZXbHVr+wWWoMySOfZ+pbkRWXJjKbefe1953S/yysMAO/pgOgSr20eRM7C4PKdN+jl
         aM0zBuAzLYxAThxD6dIDuPJJVOw7y1in3Z56t8DM5EigAsq9ldKs1CroBOvsbH4CX+fJ
         6qyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KIZhas4bXMR42PNEvpT7xTUpWExbob++Lrqpk2z4bNI=;
        fh=2EwkpVgJIJvBjguVy6cVRkY4Q9whE73F5ce6kP+jIYM=;
        b=U8g412kbt9Pv+mA7wIV4TBdR+rxwEpz3cjJw4R2qI/K51/5tkQfPAxYup+nzLTd5fk
         8pOSb7f6RpoVp8ihtcW4aR5jiukJid84HA6JpJEuN1S+gI/anDjqtZlSf2NIcMrax1VS
         FcLBAmeelQvanW84aXiwgpG7+/6BhiwxDMFJ1KlaRB9tX0wplLnpISH2pr+SFIvMqlBr
         18uUEFtrnsxRfkGTHgkvdA3+NsAHPyM3NLgEnRAQ+NBYO9cvbvVjMMS9r504hUDkrLti
         NsL3Iodo1gaqqkWYxjzEp9zP6I/TYXQS8l9/PRI/2IPzEQxSxIaTzWArz8RoYz4Ic2CF
         estQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776842134; x=1777446934; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIZhas4bXMR42PNEvpT7xTUpWExbob++Lrqpk2z4bNI=;
        b=YaEO13o2CNQm+EHtsQBk1tvzLlMa4QB/+4fxp+InHHzd7BjuoQRiVbepVS5UO6PdeL
         rM9ZW+bZ9aHJZAygtqLZUvbFzAdzYkDYPQT8DwWOXb5j26dNL3kb1wItfmOfeb3fU00c
         9WCxFz4YgLJsYOEJd+VAjzK1evceeUaAfJg/81VjD/QqcGTj/UYRPcLnVI0ZJ6dcTQ68
         /k1CqoHFiMfM+yy/J/YiRcEgzrD0xADHJqp6oWxTIYoZOUEL91upT5aw4uAtALtG3JVY
         g9hqB7IWxePMRMKBUUKy8GNFVR2gdzMkvfbp8pBiPe6LkCy47DFhR4zHEN/x/mD3f1cY
         dPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776842134; x=1777446934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KIZhas4bXMR42PNEvpT7xTUpWExbob++Lrqpk2z4bNI=;
        b=PfzgT6Lz30V/7x2CLBjkiNEiNs1/deDvkV3E2A8jZstEXtMsOVb8se//jXe9xojCfg
         nUfUluNaKsZa7jkX942Jqi/ua1+Vm5W3QOqA8FtU1oS0Cbh7fMRVHlDwnESKf6Hrn0il
         cglJEj6GPhDctb4V3CvyCG03PEpqYzRMNBBwN97CLupVtZeAmvnFGqbZgXSRLDQao1mX
         WsQI/wtZm9UlfK+Pe4ox9qRN92vam5n+gHc3pZPM0OOVsWp2kbBmkk0yy3xfy6CBIFXy
         JJUT8dMr70f6/vUWW91weFGcxVACmig7am0/lKpwahLDY01l58uVSo5n8DE2Fhsf8cVH
         PzqA==
X-Forwarded-Encrypted: i=1; AFNElJ+4k5Bm+lObrxaopX0pehAsKf6RFch33ukxZdwu2neJ3K5SJXV3T2YPNBYsjUCcLrpQdIFOdW8d4BrRP4zm@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnnudw6APnm/7UZPPaY3NK+TpBTye3EbDQ0MrFsWq9XdR7dl0H
	p8SbTpLBtocwarVNkxwC5O8ROd9lm6KBIur8EwxFInLP4tHkB9HfI+NXpbmx3okvTFfTJveWQcO
	BLmNFu0PtiyGzQIw/pxxZjYIFYKqdXh7Joi1Kh2qEU+Hw7O2Ys8KIgc+zr8S6atrLq0HPWFodIh
	QzohyANtBdB2h2IhZjitQtrCXRtlwm3bU7TjavHamvBYo=
X-Gm-Gg: AeBDiesaE9Ij5xC3xb89PoSZY729u2FN3Tipgzik209tI3rYqPYdSrKY4LZc4uAOmdc
	TWCovBdeRzC9uGPelvuxvpdM+MH0TzdrJHATysSmhoAi2WWB9/0/6Q0i7xm5DZJ005bCrvrnpaR
	le9S8YzcYxmdn0LxyOOP/r023v24zLwCY2VHBzCvZ+05ADZ2lZlMFtUxEn4eKpB3xOzxrn6uGWG
	ZNZpBoZK0Tp5vo0bg==
X-Received: by 2002:a05:6214:27ee:b0:8a3:8f4c:3b6f with SMTP id 6a1803df08f44-8b02816a235mr332567006d6.51.1776842134417;
        Wed, 22 Apr 2026 00:15:34 -0700 (PDT)
X-Received: by 2002:a05:6214:27ee:b0:8a3:8f4c:3b6f with SMTP id
 6a1803df08f44-8b02816a235mr332566766d6.51.1776842133943; Wed, 22 Apr 2026
 00:15:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417152014.3000797-1-swati.agarwal@oss.qualcomm.com> <5l46jjjywvg2gtkrmazswyprj4vqlwbo54jpbnuh7scc6clesg@zxsnca6uzbev>
In-Reply-To: <5l46jjjywvg2gtkrmazswyprj4vqlwbo54jpbnuh7scc6clesg@zxsnca6uzbev>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 12:45:22 +0530
X-Gm-Features: AQROBzBDk5T1-9xAHAu4xwxwzNvoQF6cvIzMBA9kxtDuGnjZFFEzzltBse2LvBQ
Message-ID: <CAHz4bYv_gyCU0sPi1RCrB7=x1noW6+QCFuuCXgAXymbTsWgwQA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Enable primary USB
 controller in host mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: LjI-RVsfqA5J8xlIzlITlpV5rlzgRChz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA2NiBTYWx0ZWRfX0c1mP+rFZROx
 9jk99y18m98Wzs22owzSWe8NBfNX0i01Jh/YavFHozZU/u/qD5FjUkZixG6dFyCGPmRO9qKeJDb
 ibtTHU+QSzf4XqU7Q/GjDxHZSgLKAqwNKVK1WkDmzsgBbdtFA+Z+E0kquntNCLlofNzYeZvsA0b
 WNqUDs4xxU02B6PuoIPqrEgiU6hY3mWffb41ai1YShFNGJcyU/Gkspk5wc6CYI2UbUscp7fYY7n
 UrBhalFn502VMuqDAxUId/HHoqK1Uf10jANpceEvhoMvYCHWvR4MLXcnZ1eWQUJqycf9w+F6o51
 wcMQio0o/rOfgm3d05PlDUdfIbxDxjz1wNyVUihqkvT8KRCNBpQw/Xtk8mfHetFKM5cS83x59hb
 2tbL1oZFwXVn5XdsTjvqkd0SzMyt1wrZ/nGEJQgVBajhyV6L9wW4aFPQSmmomTd3vVByQqvNyhq
 1kAd40/M5TAd4AkP9jQ==
X-Authority-Analysis: v=2.4 cv=WKJPmHsR c=1 sm=1 tr=0 ts=69e87597 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=kOHxRchjjdB9CW7pAoAA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: LjI-RVsfqA5J8xlIzlITlpV5rlzgRChz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220066
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104030-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,0.0.0.0:email,0.0.0.47:email,0.0.0.1:email,f100000:email,3e:email,0.0.0.4:email,3d:email,devicetree.org:url,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.2:email]
X-Rspamd-Queue-Id: D2FE3442E1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 18, 2026 at 4:10=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Apr 17, 2026 at 08:50:14PM +0530, Swati Agarwal wrote:
> > Enable primary USB controller in host mode on monaco EVK Platform.
> >
> > Primary USB controller is connected to a Genesys Logic USB HUB GL3590
> > having 4 ports. The ports of hub that are present on lemans EVK standal=
one
> > board are used as follows:-
> > 1) port-1 is connected to HD3SS3220 Type-C port controller.
> > 2) port-4 is used for the M.2 E key on corekit. Standard core kit uses =
UART
> > for Bluetooth. This port is to be used only if user optionally replaces=
 the
> > WiFi card with the NFA765 chip which uses USB for Bluetooth.
> >
> > Remaining 2 ports will become functional when the interface plus mezzan=
ine
> > board is stacked on top of corekit:
> >
> > 3) port-2 is connected to another hub which is present on the mezz thro=
ugh
> > which 4 type-A ports are connected.
> > 4) port-3 is used for the M.2 B key for a 5G card when the mezz is
> > connected.
> >
> > Primary USB Controller
> >           =E2=86=93
> > GL3590 USB Hub (4 ports)
> >     |
> >     |-- Port 1 =E2=86=92 HD3SS3220 Type=E2=80=91C Port Controller =E2=
=86=92 USB=E2=80=91C Connector
> >     |
> >     |-- Port 2 =E2=86=92 Mezzanine USB Hub (when mezz attached)
> >     |
> >     |-- Port 3 =E2=86=92 M.2 B=E2=80=91Key Slot (when mezz attached)
> >     |
> >     |-- Port 4 =E2=86=92 M.2 E=E2=80=91Key Slot
> >                          (Default: BT via UART;
> >                           USB only if NFA765 module is installed)
> >
> > Mark the primary USB controller as host only capable and add the HD3SS3=
220
> > Type-C port controller along with Type-c connector for controlling vbus
> > supply.
> >
> > In hardware, there are dip switches provided to operate between USB1 po=
rt 0
> > and port 1 for primary Type-C USB controller. By default, switches will=
 be
> > off operating at USB0 port. After bootup to HLOS, it will be operated i=
n
> > USB1 port.
>
> Why did you choose this configuration?
Hi Dmitry,

Thanks for the review.

This configuration follows the Monaco RB4 hardware design and intended
usage model:

The primary USB controller (USB1) exposes two Type=E2=80=91C ports: USB0 an=
d USB1.

USB0 is intended exclusively for software download and recovery use
cases (EDL, ramdump, fastboot).
USB1 is intended for normal runtime operation after booting into HLOS.

The hardware provides DIP switches to select between USB0 and USB1 for
the primary controller. These switches default to the USB0 position to
support software download mode.

To avoid manual intervention, the board also provides GPIO=E2=80=91controll=
ed
equivalents of these DIP switches. After booting into HLOS, software
switches the configuration to USB1, which is the intended runtime
port.

The external USB hub (Genesys Logic GL3590) connected to USB1 is held
in reset during download mode and is enabled only after the system
transitions to runtime mode via software=E2=80=91controlled GPIOs.

In normal operation:

The secondary USB controller (Micro=E2=80=91USB / USB2) is used for ADB.
USB0 of the primary controller is reserved for recovery and debug use cases=
.
USB1 of the primary controller operates in host=E2=80=91only mode to suppor=
t
downstream devices via the USB hub.

This setup ensures reliable access to download and recovery paths
while allowing the runtime USB topology to be switched automatically
by software in accordance with the board design.

>
> > Added support in the software for both HS and SS switches as
> > usb1_hs_sel_switch and usb1_ss_sel_switch to avoid manually changing th=
e
> > dip switch position for USB1 port to function. Also, added usb1_hub_res=
et
> > pin for USB1 hub to get detected after bootup as USB1 hub will be in
> > inactive state before bootup.
>
> Nit: imperative language, please.
I will ACK in the next version.

>
> > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > ---
> >  .../boot/dts/qcom/monaco-evk-common.dtsi      | 173 +++++++++++++++++-
> >  1 file changed, 172 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi b/arch/arm=
64/boot/dts/qcom/monaco-evk-common.dtsi
> > index 12c847c03757..6316a8270f57 100644
> > --- a/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi
> > @@ -23,6 +23,37 @@ chosen {
> >               stdout-path =3D "serial0:115200n8";
> >       };
> >
> > +     connector-1 {
> > +             compatible =3D "usb-c-connector";
> > +             label =3D "USB1-Type-C";
> > +             data-role =3D "host";
> > +             power-role =3D "source";
> > +
> > +             vbus-supply =3D <&usb1_vbus>;
> > +
> > +             ports {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     port@0 {
> > +                             reg =3D <0>;
> > +
> > +                             usb1_con_hs_ep: endpoint {
> > +                                     remote-endpoint =3D <&usb_hub_2_1=
>;
> > +                             };
> > +                     };
> > +
> > +                     port@1 {
> > +                             reg =3D <1>;
> > +
> > +                             usb1_con_ss_ep: endpoint {
> > +                                     remote-endpoint =3D <&hd3ss3220_1=
_in_ep>;
> > +                             };
> > +
> > +                     };
> > +             };
> > +     };
> > +
> >       connector-2 {
> >               compatible =3D "gpio-usb-b-connector", "usb-b-connector";
> >               label =3D "micro-USB";
> > @@ -77,6 +108,15 @@ dp1_connector_in: endpoint {
> >               };
> >       };
> >
> > +     usb1_vbus: regulator-usb1-vbus {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "usb1_vbus";
> > +             gpio =3D <&expander1 3 GPIO_ACTIVE_HIGH>;
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> > +             enable-active-high;
> > +     };
> > +
> >       usb2_vbus: regulator-usb2-vbus {
> >               compatible =3D "regulator-fixed";
> >               regulator-name =3D "usb2_vbus";
> > @@ -445,6 +485,39 @@ lt8713sx_dp1_out: endpoint {
> >                       };
> >               };
> >       };
> > +
> > +     usb-typec@47 {
> > +             compatible =3D "ti,hd3ss3220";
> > +             reg =3D <0x47>;
> > +
> > +             interrupts-extended =3D <&tlmm 45 IRQ_TYPE_EDGE_FALLING>;
> > +
> > +             id-gpios =3D <&tlmm 13 GPIO_ACTIVE_HIGH>;
> > +
> > +             pinctrl-0 =3D <&usb1_id>, <&usb1_intr>;
> > +             pinctrl-names =3D "default";
> > +
> > +             ports {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     port@0 {
> > +                             reg =3D <0>;
> > +
> > +                             hd3ss3220_1_in_ep: endpoint {
> > +                                     remote-endpoint =3D <&usb1_con_ss=
_ep>;
> > +                             };
> > +                     };
> > +
> > +                     port@1 {
> > +                             reg =3D <1>;
> > +
> > +                             hd3ss3220_1_out_ep: endpoint {
> > +                                     remote-endpoint =3D <&usb_hub_3_1=
>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> >  };
> >
> >  &i2c1 {
> > @@ -556,6 +629,13 @@ expander5: gpio@3d {
> >               interrupts-extended =3D <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> >               pinctrl-0 =3D <&expander5_int>;
> >               pinctrl-names =3D "default";
> > +
> > +             gpio5-hog {
> > +                     gpio-hog;
> > +                     gpios =3D <5 GPIO_ACTIVE_HIGH>;
> > +                     output-high;
> > +                     line-name =3D "usb1_ss_sel_switch";
> > +             };
> >       };
> >
> >       expander6: gpio@3e {
> > @@ -742,6 +822,28 @@ expander5_int: expander5-int-state {
> >               bias-pull-up;
> >       };
> >
> > +     usb1_hub_reset: usb1-hub-reset-state {
> > +             pins =3D "gpio7";
> > +             function =3D "gpio";
> > +             output-enable;
> > +             output-high;
> > +             bias-disable;
> > +     };
> > +
> > +     usb1_id: usb1-id-state {
> > +             pins =3D "gpio13";
> > +             function =3D "gpio";
> > +             bias-pull-up;
> > +     };
> > +
> > +     usb1_hs_sel_switch: usb1-hs-sel-switch-state {
> > +             pins =3D "gpio14";
> > +             function =3D "gpio";
> > +             output-enable;
> > +             output-high;
> > +             bias-disable;
> > +     };
>
> Why do you use gpio-hog for SS switch, but then you use pinctrl for HS
> switch?
Initially, I attempted to model both HS and SS select signals (as well
as the USB hub reset) uniformly using gpio-hog.

gpio7_hog: gpio7-hog {
gpio-hog;
gpios =3D <7 GPIO_ACTIVE_HIGH>;
output-high;
line-name =3D "bootup-high-gpio7";
};

gpio14_hog: gpio14-hog {
gpio-hog;
gpios =3D <14 GPIO_ACTIVE_HIGH>;
output-high;
line-name =3D "usb1-hs-high-gpio14";
};

However, placing gpio-hog nodes for HS select and hub reset under the
TLMM node caused dtbs_check failures, This resulted in schema errors
such as:

make LLVM=3D-15 ARCH=3Darm64 -j99 CHECK_DTBS=3D1 qcom/monaco-evk.dtb
  DTC [C] arch/arm64/boot/dts/qcom/monaco-evk.dtb
/local/mnt/workspace/swatagar/upstream/linux-next/arch/arm64/boot/dts/qcom/=
monaco-evk.dtb:
pinctrl@f100000 (qcom,qcs8300-tlmm): Unevaluated properties are not
allowed ('gpio14-hog', 'gpio7-hog' were unexpected)
        from schema $id:
http://devicetree.org/schemas/pinctrl/qcom,qcs8300-tlmm.yaml

To resolve this in a binding=E2=80=91compliant way:

HS select and USB hub reset GPIOs, which are TLMM=E2=80=91controlled SoC pi=
ns,
are configured using pinctrl, which is the supported and
schema=E2=80=91compliant mechanism for TLMM.
The SS select GPIO resides on a TCA9538 GPIO expander, which does not
support pinctrl. For this signal, gpio-hog is a binding=E2=80=91compliant
mechanism.


Regards,
Swati
>
> > +
> >       expander1_int: expander1-int-state {
> >               pins =3D "gpio16";
> >               function =3D "gpio";
> > @@ -784,6 +886,12 @@ expander3_int: expander3-int-state {
> >               bias-pull-up;
> >       };
> >
> > +     usb1_intr: usb1-intr-state {
> > +             pins =3D "gpio45";
> > +             function =3D "gpio";
> > +             bias-pull-up;
> > +     };
> > +
> >       expander6_int:  expander6-int-state {
> >               pins =3D "gpio52";
> >               function =3D "gpio";
> > @@ -863,9 +971,72 @@ &ufs_mem_phy {
> >  };
> >
> >  &usb_1 {
> > -     dr_mode =3D "peripheral";
> > +     dr_mode =3D "host";
> > +
> > +     #address-cells =3D <1>;
> > +     #size-cells =3D <0>;
> > +
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&usb1_hub_reset &usb1_hs_sel_switch>;
> >
> >       status =3D "okay";
> > +
> > +     usb_hub_2_x: hub@1 {
> > +             compatible =3D "usb5e3,610";
> > +             reg =3D <1>;
> > +
> > +             peer-hub =3D <&usb_hub_3_x>;
> > +
> > +             ports {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     port@1 {
> > +                             reg =3D <1>;
> > +
> > +                             usb_hub_2_1: endpoint {
> > +                                     remote-endpoint =3D <&usb1_con_hs=
_ep>;
> > +                             };
> > +                     };
> > +
> > +                     /*
> > +                      * Port-4 is connected to M.2 E key connector on =
corekit.
> > +                      */
> > +                     port@4 {
> > +                             reg =3D <4>;
> > +
> > +                             usb_hub_2_4: endpoint {
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> > +     usb_hub_3_x: hub@2 {
> > +             compatible =3D "usb5e3,625";
> > +             reg =3D <2>;
> > +
> > +             peer-hub =3D <&usb_hub_2_x>;
> > +
> > +             ports {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     port@1 {
> > +                             reg =3D <1>;
> > +
> > +                             usb_hub_3_1: endpoint {
> > +                                     remote-endpoint =3D <&hd3ss3220_1=
_out_ep>;
> > +                             };
> > +                     };
> > +
> > +                     port@4 {
> > +                             reg =3D <4>;
> > +
> > +                             usb_hub_3_4: endpoint {
> > +                             };
> > +                     };
> > +             };
> > +     };
> >  };
> >
> >  &usb_1_hsphy {
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry

