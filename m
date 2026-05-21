Return-Path: <linux-arm-msm+bounces-109156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JtBHbmXD2rVNgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 01:39:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF405ACDEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 01:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97659304635E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 23:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4843B348C47;
	Thu, 21 May 2026 23:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bw0IrQcu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FASdOSfO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34E831F98E
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 23:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779406479; cv=none; b=fYkpBT453uxNBz1u2hfK0CDYfyZpstDfmO0fIlxPfDgMVUYOKC/BicA3gFVDCik3/ll4aS/aGE7hKnMDtxBKXQvFmCMrml6KQk/T3ilsxh62MesiJfIuHnsO/6miaAoQ40vtnNK1GVXvvyL8WFgvMwVrb0yRAeeQKvJT5EMQe5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779406479; c=relaxed/simple;
	bh=qbgaf1n68DHq/ELd4w9KpIi8F5a8IXtU26iY8qjPv+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADhQIkZPfuw//i1PqnzjViPX1VTvHjUABg6yah59AocGhhYVO+fMWNTW0/qrzqPAg0yYWkDgz2Qdx8IT3MIXXKxa1vDDRWqwCoZYB55wLUzx2OqvUG1Dl8N0m9tNQtRxVXqOYgWeEVqK2N9LkyNdfMY9pIPNSh19TbFQOuCWqTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bw0IrQcu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FASdOSfO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LGk0C92765104
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 23:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rs2uyQSF1oPVMVFPdQ925UWlTzbTR3sEuXIcmBLGD7w=; b=bw0IrQcum001/hsw
	TnifcMrpE8M0m/xhzScjbFu4FLrpb6opcg4DWfU6lAHYeJ72l5oDCXHgWOI6hg8u
	0IdFeDcVVD0Lxkjm+wRKvs52cNIwohZ+IXA//8gFs8R93Av85ouweaqvC2iUlLQm
	whcVdLyE7HWfmDwYdRTUhnt2RUzJ5JTRY1rKTzG12x1vE/6Ejeox0/wBqTjRR5ms
	58EiMCE753r9BA8O6+KVrRWWxji6z/bIixR2WojpXTQ/4patx2pE7ehgqs6XA/VY
	lR0foj6k4/AA0znZvYVS7tUCJCbkuSe2BskJ6c7QGffRCerwrR1/+Dx4chU3MQ3F
	NZX+3w==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7t7nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 23:34:36 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95d1fd7dce7so2680083241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 16:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779406476; x=1780011276; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rs2uyQSF1oPVMVFPdQ925UWlTzbTR3sEuXIcmBLGD7w=;
        b=FASdOSfOdG7be9XaMNXJVhEpW+ymWd9S3D2dS1SDQs3iz6ZWbCqhybeAoNRo9os14Q
         abbhzKEXlBX2FzqIaVXCmTyYNn+tbhNj+4fjd5X6ZDKokqiZ73tjTphwgFl+CbjwkSm6
         AdY25J0Iu0K6fKmbtc3ud5QH5hSw4GdbV0AA1qicQrgbg+9EX++fb1CYqolMUwhYtzJg
         +D/eql82GjwVbN4gmxC3RALvaQeSizRLsNkn22NTe8En6pmOKt+eT8Vymb3ToJh34Dcx
         fWpVc+noBkDqRb572XESHBvreUIUYNOEgt5ww2vW5lDMaOnO2W/Roy5CQU4Uj+diwl3I
         a5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779406476; x=1780011276;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rs2uyQSF1oPVMVFPdQ925UWlTzbTR3sEuXIcmBLGD7w=;
        b=Qhlc4zsfiJT2GwTg57k13u97tP7bcs11ejsCa6uefIAfV6EVtd+LEo7RiTSBfjxClR
         XetMJJvNQcB8XF2/XnyXGHTZ7eTM0DKtGcBArZi5frZ2ZQxHcneQnusf4hnOGXBTcMuy
         8UpOkLo+usiJm0Abt55plJR41HxnsiqPFHgbIvWDB4fyoQzWxovAFs+Xy9OtCIPu6Ghx
         Jk7E7lh39NhtQQjAcD74NqbGQa98cu3iPj8k8jd/NqQ/ZUYZqCFNw3W3O4UHZt/wgF4j
         HJAc1ezn8rboZu5cFEjVegfq2IVr6AMMn++OdFUK3oxuUQ+55fKyJ7+fIpVKKbvzf+DS
         0qmw==
X-Forwarded-Encrypted: i=1; AFNElJ/LTRUmY/cbz0NExolfQZAoVij78veBrsAjVyItQmeYvSZ8qc7GzdVfcdvhxnZ6xmAgpCYhgtP1xClX2IxW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0cgYKmabbLnbXXnr7JFuz3dWhw6aIrYj/Sd+lXxerxLUbcH6o
	mJybdPTEsg/Fl/qyWGzjLf750IBwrxYPCzUrX9D6GcRc+5TwZh3UUlPmVdEgOVCUnF1weG7sIIO
	teqhCc9znaXg+bc26l6uZTh8/f28Otv99vuU1YaSp3FJJQ9gq27VSRjyE3QFuMp/GYnBH
X-Gm-Gg: Acq92OEh8JW65BhZ1HLUMkNrSMoJPQPUIyK2g85boIGq1Hk9v2VuvmUVhfph7PArN4Z
	/Wz6AhQ4cqIP0L/HbwPDriEye1qW1FKpfn14TSF5cFz+BbzvoxiNK2rLf3K60+vMHyWDyPvi0Lj
	vvrqnIrLenb44I6Dku8PRRAMLtutBMK7y7JELa7ALerUVZakY/TQ27yE1/ox00uwjyidnlZYdwt
	OXucLhgdRXzXteX/KgF5iSmFGeUIbhgzBabxOS5wdHE2Gou6eRYstLtuObs+IbPU6EHAyBghrEP
	AmNjNOxIhCn3RTlQpjFI3NutBj98gfn0cNGaaItkxmC6w7pF2K3mKh/TqilC/1yupvVFzEcrkOa
	KllhxFGIXFtSvwU/Ce+rJ0Am8sZBGfDB/rDBUGNRSoNJviVN42sY+JEV1HKB5RDH8LS5hF56PMR
	fembc1pSZk/nugaFdNR3iZQcN6q1fJllPhD7m89giwP+NCSg==
X-Received: by 2002:a05:6102:3046:b0:631:487a:23ab with SMTP id ada2fe7eead31-67c7151ace8mr672963137.5.1779406476008;
        Thu, 21 May 2026 16:34:36 -0700 (PDT)
X-Received: by 2002:a05:6102:3046:b0:631:487a:23ab with SMTP id ada2fe7eead31-67c7151ace8mr672954137.5.1779406475625;
        Thu, 21 May 2026 16:34:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa328721bbsm74863e87.50.2026.05.21.16.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 16:34:33 -0700 (PDT)
Date: Fri, 22 May 2026 02:34:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: pmic-glink: Document
 batteryless property
Message-ID: <bsrozsgwneuzbwaz7r4elv43pk3zuprziosnok4kpsvo4fgwtu@oq36cnmsyrka>
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
 <20260518-add_dc_in_support-v1-1-31fbaa329879@oss.qualcomm.com>
 <fd58d6d7-26cf-4b11-82ad-05b4863b6dd1@kernel.org>
 <20260519082526.odmn5dqi2jftwnln@hu-kotarake-hyd.qualcomm.com>
 <20260519-first-wine-bulldog-a6a4c7@quoll>
 <20260521071341.q4efqssppvettaey@hu-kamalw-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521071341.q4efqssppvettaey@hu-kamalw-hyd.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a0f968c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=aZZmYXB-Xrw4pg2EUBEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: tYq4RGqp46rKfA_kkLHjeIkKB7Bz6l3m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDIzNiBTYWx0ZWRfX1IuNlZqpCzzT
 yhRJ7eaiKhkaXiDA3ipcVGLsonm9rava+iHoXYCAUrmw0DoTeAW6sOizo8c4LSBDIrHKx4yUO9M
 gK7a7ooat5losl7uYqKuXr7aSiMHgLdnzDBPjYn+rzJUIBJvEdxjvYwOpoEuWrwt3/BWz7NysoU
 qVKy7/zzfgsMKmP9NItyRdbH4Oq+1b8rFMd05Wer/D9EnFD87oDmeFExSlwllV0FSuP9qe+Wmby
 ZmblEyu4v78SZLuMY7goBa2G4jn+KQDQVqNdzU8KrB7qf90H/9l4vJ7iWheXMKaj92iuLbRzxMx
 amXJgmbaxt4pXdSUCdU9i7ydl8zR/gTPnddNyJ16CjRQ6Jp86JnfhWAstqV1XsovG5CKKnUeuNJ
 yFJy9V4i59LwzlJrGM0nIH1YD+XWOTWdK/Mv5pLtoOBGEJLNw/sY4TM4iaqyf92XA7mmwwPfY8M
 R1ft6TE/g4hIwhIxU5w==
X-Proofpoint-ORIG-GUID: tYq4RGqp46rKfA_kkLHjeIkKB7Bz6l3m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210236
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109156-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: CEF405ACDEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 12:43:41PM +0530, Kamal Wadhwa wrote:
> On Tue, May 19, 2026 at 12:35:13PM +0200, Krzysztof Kozlowski wrote:
> > On Tue, May 19, 2026 at 01:55:26PM +0530, Rakesh Kota wrote:
> > > 
> > > > And isn't lack of monitored battery property enough to indicate that?
> > > 
> > > Regarding monitored-battery — its absence alone isn't sufficient. The
> > > BATT_ID line on debug boards is pulled to ~10kΩ, which is used during
> > > development phase where some battery properties are still present. The
> > > same ~10kΩ value is also used on some genuinely battery-less production
> > > platforms where no battery properties exist, making auto-detection
> > > unreliable. Hence the need for an explicit DT property to identify
> > > hardware platforms where no battery populated. 
> > 
> > I don't understand this logic. So you claim you have debug boards which
> > do not have battery, but define monitored-battery? Then these are wrong
> > and fix them first.
> 
> Actually our firmware treats the debug board as a "fake battery" rather then
> a "no-battery" case.
> 
> This is done to avoid triggering shutdown or trigger power/thermal related
> mitigations to kick in from the HLOS (android) that is configured mainly for
> battery-backed devices.
> 
> Note that we can know if its a debug board, just by looking at the battery
> ID resistance or the battery profile name in the power supply properties
> for `qcom-battmgr-bat` in sysfs.
> 
> However, the problem started with the boards that are battery-less and
> unfortunetely used the same debug board batt ID resistance value, so from
> the firmware side the batteryless board is also seen same as a board with
> debug-board connected.

Which devices are using this resistance value? Can this be fixed by
resoldering the devices? Can we fix this by pushing this property into
the adsp_dtb.mbn and then using it for those affected devices only?

> Since firmware does not have a way to dynamically tell if it on a
> debug-board powered device or a DCIN powered device, We are required to
> add this new DT property.

No, you are not. It's just a solution that you are proposing. One of a
plenty. Please start by describing the problem:

Device BigVendor some-EVK v1.23 has a hardware flow, the soldered in
resistance makes ADSP firmware emulate a fake battery rather than
completely ignoring the battery when reporting PSY properties. This is
confusing for the users of that EVK, which are assumed to be not able to
resolder 0203-size resistance, etc.

-- 
With best wishes
Dmitry

