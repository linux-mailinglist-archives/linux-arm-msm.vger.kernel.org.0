Return-Path: <linux-arm-msm+bounces-110696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AD/SObhPHmrmiQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 05:36:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 488A7627D63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 05:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C63E5301C5BD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 03:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A5529CB24;
	Tue,  2 Jun 2026 03:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e2fC40qf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjP8lJfP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E957B2DCF55
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 03:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780371178; cv=pass; b=IEW6T77lvvhpRUwu6lXI0pYZo5j4RQMi92XpVj1mciyRVpJBQ4I0S5l3WR7GepJebYyMRw/MVlG6N0IcIdZgEdqXmSVuwsg2IJR6pc5Wt47LjFPhMn8lcylBlvWKjjlFvWufGN87DHg9wCm+GHwsUFNcScIFmPP0CIPLk2yD6F8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780371178; c=relaxed/simple;
	bh=JsbILUc2MqRg0Kz4TLV1RtuG+L7bJEMwjzE/zzc0pSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ihBsnfk9DM6/n+401qo8N9bTYBS3T1Lkzgu/wUBQUK4Gn3fQk9Yw7Hy8llmS/mXXfqjzc/75vrGpCcYNp+SFrDBAnlMeWZngX+9j+9sWUwS0FYATgIC/SJYGZA0LK0Au3i9/SushaCfJiVuHievkflFXdMO+U86FhPHHT0y3VKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e2fC40qf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjP8lJfP; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6520LkkL4065409
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 03:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qhd5e8S16leMfeXxhwe5B5BRfJS5NsQG99cPsuJ4qCo=; b=e2fC40qfN/oKVqQM
	o7ej3cSCBXhZxXET2wYbmIg/mCJONTzq6zVu/A/6A9CTcjCVCjQHyHs4wmQQPTq4
	Clr0temfkHIHGfI2qlvO4iev91i3+dApm3u1UFKgoQJsOPBmckRs1WgDcHbVpAjt
	471Pux4Rr287bbrQ2R92D+BAELUFnpsSJwqSA/fcxd9NbZPN99i3NHVonVY8H8X/
	eZKgRdKlhlP285KKdTluvn5VXZnEKoUM7Czj3jUpNsAHWYUPzFzN7R8ABWzIskbN
	c4SkHpirwoYPWIlPA4x/3F6lVBYFBXCnl/hU2n2LMCuSWx1kuirSApf43b4Owjuz
	4sNB4A==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6swvcv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 03:32:55 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7e16f06013eso45163697b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 20:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780371175; cv=none;
        d=google.com; s=arc-20240605;
        b=F4ToCz6NTXVp8uTVMItIbkOIoWjbvN74JiBMGVBbsfjN6KJjClfGqzAUgRzbDx8xgh
         hYqmzfvJ96MA5D2l49oGKOq21HyE6O7AP6cCDKzvRYs3AcH77AaYv+G4Td4q8XrsrZ51
         c0urLMOu3hemZKUt4Pax6DbMjfmSxTgepepJTGG93/74UawhNsfhbT4HIFTUuo6W8zdK
         zsgJKKc8hWuMaq5FqNl5YTzjenEsNvwXiynIBaNKDJT1GXLmFaSt8EDN9gJlg+iLUZhG
         EwAPazN8XfHMtyklt9gxZwrAQ2C7ElQ9PDu4PXJnWUom70AZykkz2tx6a+NfXC98bcOH
         arZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qhd5e8S16leMfeXxhwe5B5BRfJS5NsQG99cPsuJ4qCo=;
        fh=ch6ZhLoGN3Cxjwv69uhgPSMCLIxkqZjM6T9MtGco/BY=;
        b=GnR9YCbG/KBFRiW5WI5qdPEONDk7F3Wr8AkvwyTn5/RpfA+1/lJZ9xv2m1nTDtsPzZ
         GKvFWOTrzGuU+/8SF8KtiGL1DUOFCOtUEtzi0H+d5OKzb5ftneDxvTzm+bEs6IKZbVUx
         8u2/XQzvPKZEwDza3IkiO4DPhz/Cpxm1zwEVXfw3L1kFnYDQcZ+SbmoT0Kgu0RCR8ivt
         G7YI1ETGd5RDoq74GpqDNi2+CYjMoaacOYXdP0yKxZISanjBQbMTgGFekVt+f5JWhMMF
         MoYR7oZhAFgvQe2IdeZDR67NMt6Yqcbtjve8pqUo79m/6kcvxe3ePyyE3E0nXleq03BT
         RFRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780371175; x=1780975975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhd5e8S16leMfeXxhwe5B5BRfJS5NsQG99cPsuJ4qCo=;
        b=kjP8lJfPck5u78LR4hUE9S6Y16dGZBZ1on5AgBP10266gzsjJkSUwDqHhbiv/0zewE
         9JFinlzFsOk2Jh5E61qpmJ6KjEF5QlLYgjs6GBPikuCsSVvKrDX0ksZmAprpoeVB15Wm
         GCQ2JZr53go1Tg6OqHarpWaCYJ5GJJJtzSbnZ5uFCWBDQsO5r7RlbsxowcyxeFpizxGj
         xrS3NQIyVcdYUx1ol3ftby8+ttrJLSjELTjFVouEn1TlUlwi5tU9+ap80pbbCcRgG70h
         xsPrX+KTJlvZ+8Nu06Rrg9vN2itXlqdo7swzX6+dTgAHBaqR+jfRvXbICEDx2ZKayH7e
         7eWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780371175; x=1780975975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qhd5e8S16leMfeXxhwe5B5BRfJS5NsQG99cPsuJ4qCo=;
        b=gX/zRHRcHhp2c5PYNykPAFk/QUE3kb77vwtShwfDZK9UoM1Owr6GFug0KyQ1d/6lb5
         PHavhja01ADMl9Iw5H9dph/tGJEdzRhLrT7JMUrNbky1BT1/eKwLqfTJvWDmqebYEwsh
         T0KyamYVFbndZyaM3XQ6xzKzScapsUr6m/Dr9SJMIDL8UcsqrrN4PLXrWVqJdslULpTP
         1jCnHZ5SBDGl1iWQYwB61lwWNciux2ODByDu1yDGpq7WkHjh6qkw9qIbdBeM78cCW5EH
         hJPWW7gYOF0GG4yNo/BVRT6YyW3+Z1+GHut/e3Zaoj2WraGAGTiP1PbroCXcY1ry8Fcb
         6zgA==
X-Gm-Message-State: AOJu0Yzsmv4alK283JmfHd6XAhSmmflVBgDfBOv/yCmSDrFSjvwv9KaO
	NOVjCis4C6E0ZzBCccJ3maj2RIW/n+wM4bMcqDvRdfGcNWbVBrfw6f7rmvjXY00yUdJKqiHrp/Q
	L0452Sokbk8NoR/0cSOw4lsFdEz4rwa0vmSWyi3k8KFoyDPXx+8p55v3JPVmOm4o4aNYYzYDDsf
	UkXUz6SFJ/QeRNytpzlx/k6QQrCcR80juwgUteTQ7jgUo=
X-Gm-Gg: Acq92OFbqPBTRrl8rvfF/4kWsb+d/nuvVjotQQFTuvdsC93E6yPnCYSo5cMifzTptQZ
	yh1ujj1YqgigO3x5dQsWOJDtIqXJiQGueKWQeNnTmXrJcTxPwQCkP26o4rER9vSmo4JO0ywX9aR
	PBr+mkdYzZfc+futlHW2TfaNQuRbwG0Dvx0gKwLv5h5vSUR+PELnjfbN9UFgRWvB11mTd3uRxzB
	mzl37Ao42WAWLnISQ==
X-Received: by 2002:a05:690c:6202:b0:7bd:a4dc:c22a with SMTP id 00721157ae682-7e061bcfb82mr125935127b3.48.1780371175253;
        Mon, 01 Jun 2026 20:32:55 -0700 (PDT)
X-Received: by 2002:a05:690c:6202:b0:7bd:a4dc:c22a with SMTP id
 00721157ae682-7e061bcfb82mr125934967b3.48.1780371174810; Mon, 01 Jun 2026
 20:32:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531071409.3557734-1-qian.zhang@oss.qualcomm.com>
 <vvnecdwfbpzeuo2zjk7ajkfwaay7dexjncjuuhiu5ldqlp62wp@ybhqbzzj6x2f>
 <CALC2J1MXRygj9oRwEBsSPfhLjpRZi1T=_E14vkbOkGKKTCz7cQ@mail.gmail.com> <hrqzdro3s75sf4tfphmbzswiwquflrj2krm7e4bkohn3zd27rv@mra5xbg55qqa>
In-Reply-To: <hrqzdro3s75sf4tfphmbzswiwquflrj2krm7e4bkohn3zd27rv@mra5xbg55qqa>
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 11:32:18 +0800
X-Gm-Features: AVHnY4KjD12CE3aIN2RhduaOMBHpw9ezYCdyAibcKu0AR08HXiZQUEcpI2UBAAI
Message-ID: <CALC2J1PLbuL3dpkL8jyhchREB1d1Pc0BLHzZCdEjgfitQahqNQ@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B
 WiFi support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a1e4ee7 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=IdTbGg7WZLYeGAxCe_YA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: ij51X8XGx8PbrZmenCkIt5dkrGRye76Y
X-Proofpoint-ORIG-GUID: ij51X8XGx8PbrZmenCkIt5dkrGRye76Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDAyOSBTYWx0ZWRfX3RNgvV3xI1wp
 yw5INaXx1e4LVrdIMvUmKiXWXDRxXcK17Zt7Z6SbapBO48tPKW1IC4Vzkkt6MoI6Ao9ye7aYEMi
 dID/QOGdyRLF9iun/TJwXpm43k2IbAprzLC3XuQob9Xf+TySa/fv4I6lvkSlfFiGtt9k7ieRXOM
 3LJ54CvprWinw1rAjrNkjSb3Ai6gGTRrFh0Mxg0NNaYBHXqQDIWCajoz+ibvck3VapZjtuJ/7aw
 p6S9mIhRgjYAxBfreSjDdIe/y2H5C8cmXkl+juvlr0UFOxmoKAn7xNAQs+d+2cF+XjPVWZ6j2e2
 SMEC6pT4yaDwTJ9+pZbrLM5vuuEUl9jAjQ2DAHTOTGJuxSlNssiuhC5dvhkkA3HGime/StKRiIz
 8uW/O3+M/DcL2jq0O9MdHfgVEivOLDzFCMs8n6dBkgpnhMi45wvlxf42vyKzBQKQzMWI0SeODhp
 20sQ5AeXt0G4GGO+GdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020029
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
	TAGGED_FROM(0.00)[bounces-110696-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qian.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 488A7627D63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 1, 2026 at 8:39=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Jun 01, 2026 at 07:46:49PM +0800, Qian Zhang wrote:
> > On Sun, May 31, 2026 at 5:09=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Sun, May 31, 2026 at 12:44:09PM +0530, Qian Zhang wrote:
>
> > > > +
> > > > +     wcn6855-pmu {
> > > > +             compatible =3D "qcom,wcn6855-pmu";
> > > > +
> > > > +             pinctrl-names =3D "default";
> > > > +             pinctrl-0 =3D <&wlan_en_state>;
> > > > +
> > > > +             wlan-enable-gpios =3D <&tlmm 56 GPIO_ACTIVE_HIGH>;
> > >
> > > No bt-enable-gpios?
> > BT is enabled in node uart10
> > https://lore.kernel.org/all/20260429103537.1282497-1-shuai.zhang@oss.qu=
alcomm.com/
>
> The BT is powered on by this PMU. So, if you are adding PMU, it should
> be used by the BT node too.
>
Will move bt_en from uart10 to here.

Thanks,
Qian

> > >
> > > > +
> > > > +             vddio-supply    =3D <&vdc_3v3>;
> > >
>
> --
> With best wishes
> Dmitry

