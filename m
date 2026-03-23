Return-Path: <linux-arm-msm+bounces-99120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKNeFi3uwGm3OgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 08:39:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F094C2EDAE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 08:39:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4318D3031AD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10673603D9;
	Mon, 23 Mar 2026 07:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FWTZeROD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CirH1nMX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777BE35E529
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774251411; cv=pass; b=j2sICfQu1MFt2xz1xvJE6Ny1w+kCHC6wkS6cKvhxGb0PQFnGR25/dM4uF2Ui5lS+uAT7r88vissSAyKmWaPUrhB9nX5PER9+4Dc+TMKvwOxxwHyp2EehV0mmRQI1y1N75ai6UhKmIXunsSwALVU2M57Jy4XwrdA3Zu4eoEN6mOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774251411; c=relaxed/simple;
	bh=dE3eHD/xH3GbKQZD3wXfKMDB+XRJOlJRRKpaBH+I6gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H6mEsX6sU0ShGjuBCXzchkYdKJRR4z+2nbovdqOJEEKo+XKLi79Gljzn4lIkb9SliFBLXr0h1/fmmYvqI4DBp05XmfFzi0d9lQzPMbjFqk4ufG7dHtavl9+NhnuHX14kZaIdCJ5zDl1Z5OWtZI3KG0Md64YZl2PyiCxBtJlCdFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FWTZeROD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CirH1nMX; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N73M8f894501
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dE3eHD/xH3GbKQZD3wXfKMDB+XRJOlJRRKpaBH+I6gg=; b=FWTZeRODWjifBRIm
	Qt7LIqjlby6QBv7fVstfT7yzb/FCwWNXnDBzEHoTkXmMzz5bS7hZECFF2Oyqf9JC
	TpW4xcJB7J64UXQDwIuVbWWQLh6TKLYzUZELLsLsFB1CN7ZrWud8wUN+ruWiXndZ
	ddiwhvGKv5euag37IWPj2vc1/KAL8oPTgzftbUZSkHcyAAlQFh9M+tnvxV8wsPGq
	LECKqFyk2o8ZsREkUM9sGFoQS2PNmVuJLxC2u7RZawBE5JwAR83f0i3QN+L32Yxa
	/fLf6Jm91hhxD6V5iUgRh/plBiqO1M5xN/zT4tgWGr0WMA95LsvfvrYGQutj92pT
	I0BhRw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1j9rcawq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:36:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89c514077a6so255057046d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 00:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774251409; cv=none;
        d=google.com; s=arc-20240605;
        b=VCLMylntxhqXu7/U7wc49JTY/yuzucrOCaC+8GF2hEmD0TWFrPkfVOclM5cgBVooUQ
         jn1TRFkYGIdEsMGxknrXdXNBbwTIT951q1ekwEajy6hlAVyZr1J1T7fNtFNEIa1O0C1E
         AYzGSjSSfulrjU2eLqhk/ZMVTbjJBXMcHxDxxMVmGdagGseQlZ/E9AHZfpuWccV4rHlU
         Uft8FnQqVZ68Tqj9RQ++x7kmqck3efiDm2eO4rXQDbFSx8qCIm+RTZwMClWOu/FAEWJT
         u6Nxya0jTlRPLdSala37IwfYBuqnQaG888mNUMreGKAgfVRf1FIRnMtL91km9qdhgw5B
         C7Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dE3eHD/xH3GbKQZD3wXfKMDB+XRJOlJRRKpaBH+I6gg=;
        fh=9oHiUo0S0jVJp0wCNVFISsiHavrg798xIcamHshD6I8=;
        b=dkmf7wxNXRVem9veSWfvUn67U7wViL+92KGnz/82nbLC2xB6t8+4psFpynpVpr/WcU
         cy9sVJ56wT/zAogo2I9fFO5NGfHXm0EdooLsTUosCkT+u6wTtu4YmL/NVgbY3F1rPV1a
         pt3kQbdwen9COxIFBCYAfYxiYSc5E5Eh6VE6toR8Og7V1Ovg8d5KdIBOLvn34AecLSSw
         jTpWERsfpY6QLDiZF0yxe+SDhdXF/G9OkpE7uCjofufxMP+z5L3hmMxMpfNm39zh9/LJ
         OtL9hL37JU0POmC8x+ePqK/ZCtt6OWN4QpoXWEYsiHIQUwhd6OYfqg3zTmpStn3nGSCr
         gs8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774251409; x=1774856209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dE3eHD/xH3GbKQZD3wXfKMDB+XRJOlJRRKpaBH+I6gg=;
        b=CirH1nMXtnzg2jAONlFvQDjpggNuKvyE+jS94pZOzkG6g6kzP+sFJp8CjtIxnLe5li
         yN+MbrJcjuDzwBG2t8BN/HbBk5mM0lLtO6gCe0NdBtd0508zT+DcxKbFM32iXSuI47XA
         hB1jzAMNDuzJFt2bhaUsS/dUzzZlrS4DFzW9QCZ9zQs94p+IvNleXg34R9AMIS5jQBd1
         qTBoXBvB9pztqMo5ZFT7nR1AOesxJmnFnqFavX1KDX7kqw1ru/IY2Y+zTijiGqzggfUq
         MB6wYCcqazH9sRr4KTEVY5dLcx88i8hvDjmEBYyZJ44urY+e875Wrdj7cjdAvR+eTQoi
         lBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774251409; x=1774856209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dE3eHD/xH3GbKQZD3wXfKMDB+XRJOlJRRKpaBH+I6gg=;
        b=Xu7h/gGe3MPB3L97EBuMSMhmRMEqWS4gtEwH900L5aLapNRa0Tear8Ebv8cmDUCjwp
         rUBgLQGcKsRLllGdZMaOxkY41KbZDVJgucnmP9wLZGXVF3ID7nJjlMCGsFq4/tpVa/zo
         1xtkcmF2+lVaogF9lunxiSqONpV8e4wjMdQElxdvj4iZOqNOsnwkhg2wNJyclWNC0Sfx
         BykjHn10IUKRfhb+2cKf/KyiHIyzHbH0bPNgH+/Dx/aDeRngIkxjlWivelJUIxVwaca6
         8VxsFYydLXjf69Gt1XVWYEQurs3x6eGJD4ob1ph70J62eS43hj+XYaz+cCAlf86a+EWb
         6GAw==
X-Forwarded-Encrypted: i=1; AJvYcCUn6Rj6gkYx99IN+efNDz2B2WjFuBHuDb2EEhPvhVRlGrbWqPUF6yRqEwSz3Ggx4oHrOqvRT/nVpeTD+kN1@vger.kernel.org
X-Gm-Message-State: AOJu0YxsMbTkfWgWsoeIjUEH9Wk3UCdiegBjjZTGDx60e1B/qYFvmYiN
	Cypij7LgCHTv5TSjvHEYf7k87beoGeRzraAF0qc8krVQktt2q9+15Kt2XKMYi958iSesBjaGRse
	0YSFKA89lTBtOUCGgRC9fafIDoDTPey2aKM+3xKcKaT6Z6pVzin2i5uBq2ep1BtBqKJTjDIlbIt
	jA1riYz74CRpKSMK1l271/Y+9Or+a7DlUO32K6u47hF10=
X-Gm-Gg: ATEYQzwS4sXqCw7JZOpO7cW+VgQAQwHF3/mTDa9aPH0TWgpySsC978IHLxnpSwy3BM0
	ocB2nEiod3VM5gndoIVaUvszoZWvmR9Al20zxZb0qWdznIVqOu51zlgvKvJy97EdzVNKfFO3hZU
	Zrv86Z+IbE+s0C1b9YMHXBWih40zBItMv4eNYzvKpA3vh7Avuwmgos8BLhqU6PMuh63xZ35Qbx7
	t0UB4k=
X-Received: by 2002:a05:6214:5984:b0:89c:5f6e:451a with SMTP id 6a1803df08f44-89c859e9734mr188298176d6.21.1774251408766;
        Mon, 23 Mar 2026 00:36:48 -0700 (PDT)
X-Received: by 2002:a05:6214:5984:b0:89c:5f6e:451a with SMTP id
 6a1803df08f44-89c859e9734mr188297976d6.21.1774251408357; Mon, 23 Mar 2026
 00:36:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com> <20260318-neon-vigorous-prawn-dce7f3@quoll>
In-Reply-To: <20260318-neon-vigorous-prawn-dce7f3@quoll>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:06:36 +0530
X-Gm-Features: AaiRm52HLt66wHK0FqCRZAm7RWW-bc3MWhfzPCBrm6w6z19W9eTDZ_q3Njv0RbQ
Message-ID: <CAHz4bYvs9mnDwfkfjkebucZSQpugEqr6+sFf1-hgzNO8SodzQA@mail.gmail.com>
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
X-Proofpoint-ORIG-GUID: L8xQYop1hbX5rxDWhSPtMD2p4nw7BrKX
X-Authority-Analysis: v=2.4 cv=ZPDaWH7b c=1 sm=1 tr=0 ts=69c0ed91 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pPiH1uhGe7me3s5KK7EA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA1NyBTYWx0ZWRfX6GOtyZPyqo0V
 Djehd2mbEHFOGULeZEZ9uc2IBM6skhR6NAtLdwsjyrT5VVxk0Ej6lmyjeqsNsxKpSm153J2FJsu
 vn/RbbMEFTx7wf1Lzgb7jondN7GZBQWz6tc01j+57dTayHFtNqF6KwhVMQZGNhPd0wV3NF7Wn2+
 uUHDS9TlNnMWbLKAaloZy9bjZUBH10u77OPffnJyWsPgrmfy3bMG9mtr6Fzg69uSWtsgbd/dH5k
 qrSmwwf/OrDgDO3h0B7G08tKa16ZLL/03Hrop96+0AuR73fkB14EnRIlSqzDxS6Bl9lr1x/mTWz
 au/fV3tU1YyFGo+s43hwyUiUl+zs3i/2WTAeDIvmuRflTMsXGjWEEVstKYocZ0HFQDKf6XmTwrr
 jRH0A5G8sbe10TMK2/uxGAl4/IX1/qJtCJJ9yiPaGQDrvU6SNoTfQe3MnRqyguQ2PPzD1kCVhKG
 YZn0mccxTXuRPl9Rr4A==
X-Proofpoint-GUID: L8xQYop1hbX5rxDWhSPtMD2p4nw7BrKX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230057
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99120-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: F094C2EDAE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 12:33=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Wed, Mar 18, 2026 at 09:36:40AM +0530, Swati Agarwal wrote:
> > Enable secondary USB controller in host mode.
> >
> > This patch depends on:
> > https://lore.kernel.org/all/20260306091355.1178333-1-swati.agarwal@oss.=
qualcomm.com/
>
> Honestly? No. Drivers cannot depend on DTS.
Hi Krysztof,

Here what i meant by dependency is that I have rebase this patch
series over below patch series. Below patch series is related to USB2
micro USB controller support on lemans EVK.
https://lore.kernel.org/all/20260306091355.1178333-1-swati.agarwal@oss.qual=
comm.com/

There is no dependency of drivers on DT.

>
> Also, combining here USB is a no-go. Do not combine independent
> patchsets into one patchset.
>
> I also do not see how you addressed my comments from previous version.
> You never bothered to respond and I do not see them implemented.

Apologies if i missed replying any comments.
Regarding your comment on v3 series below:- GL3590 hub used in lemans
EVK requires only 1.2V and 3.3V supplies for operation, confirmes the
same from our internal HW team and update the same in thereafter patch
sets.
https://lore.kernel.org/all/20251220-economic-gay-firefly-1873a9@quoll/

Regards,
Swati

