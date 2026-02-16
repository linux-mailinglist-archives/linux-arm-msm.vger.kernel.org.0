Return-Path: <linux-arm-msm+bounces-92982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPgUDD8tk2mZ2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:44:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DA4144C85
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:44:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CAE03007F55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3103101D0;
	Mon, 16 Feb 2026 14:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k/PBj7ml";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="heXykT8l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D35A30DD30
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771252982; cv=pass; b=E9pmP6cbOVux5kbV0am1LxS7j9hEFX/qdtwxQxhx3pm2G7Luaq8arEiPXWvFARU9wAKV9a/pr5HQfRw6oDaapnQdOcLEhF2mZ4Jzx9cOk0yp05cm05hd7Y+w/7k9YvmAeMyzjjg5uGP03JrmYXeCWxCWp5XvuNgVefSPQChPTxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771252982; c=relaxed/simple;
	bh=oKMP/nTcI5Tpxz9gaCVDwBBk/DshWpv6P7P2HESYcb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lhJ0tzW00ueQ4Olwx4r5WEz2vX8RihgeG4xbohBe17OBFC3F34kcJvp1OnQ31lIS8RaVEqXiNigYx73/SfgDVcvg+6+K7nbHXDvCu/UnB+7FiYqTPIeZKuEUZpId9qrM+9Pbue4NJwHW4PtGDxK9R6iRq/HXcX6SogglTYDi2N8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/PBj7ml; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=heXykT8l; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GAHqDm3272627
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U5Gzjc9tAiUUaqjly2dXlEx81OeXi57C/GyrkWxb8hw=; b=k/PBj7mlCFoB0N8z
	OCw1a3hzqmnvNM+8BgAXpwcBfNz55k4xbjpA3fcNQwZE+crJv1HIqhJGHfbx7jAU
	iuI/4QUcnr20NqcHXF7WO5SKktvojiXAqrICdpVsmCNftJcVV10Uut2UrRwtHOC9
	ZwK9C21Ls27CrVtKO2V8YfZlKsVgLeCWPcRXEcRKG200QjHZm+6duH0Iy4S5lFSm
	+gNhqVMiDb03zyQGqXH2pEWnGWM1GHbf/1oPPYG1C85PkPAVctxeoSNMH/k2yOX5
	FFYj+AUry3WP3RarzOMmR2DTJ5VAK+EbMhCCzaKhRkXAJnX8eC3h1O6wLXFxP3pM
	y+1neQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4caj7jcq66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:43:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3569ceeb335so3381633a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 06:43:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771252980; cv=none;
        d=google.com; s=arc-20240605;
        b=E2R6xyu3MDcUJwktBY9j/ldRUz0bhV3uEFhOXSIGIIzan5nzkVGvtTvTfiYy59qMrv
         QJtmAQRxF9JEaV2hVGCjlZrZ256FdFH1M7UHmJ8nDCMTOAVGux4qcvHY+MlE8PWzgeM2
         lgB2ffR8lVLRB+EDT5dWYYGDWx2YcD3c0Hh3w9VfcyviAGFYRzcvNmQXPxPyjDYQ92BK
         XAb5j8p6GBHzRQ0AGtame0lXJhIrCJlYhirWZb43AAu1amf6Sgd8jmFp/vr0AuYrjgxo
         rqNbkPvlUfoL0EXvA9RFHIuoZARnU9WEQnRUFoVWcWDkG6NJzepDyGgupY4vhiR1xNtu
         sFzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U5Gzjc9tAiUUaqjly2dXlEx81OeXi57C/GyrkWxb8hw=;
        fh=exmmNeL9BvmscY7q+ksFifHT664MKPqPm3UpEn/an5A=;
        b=UFt6GsKqYAzSx4W2OvLq+0LMDPvTw1KNo9NRYtYmpJzAHd/ifghw24xjvS18LfhNuJ
         vtrGGbrNC45PPXMeDWytXiPtVFZ/7LNLYpYP+WsNFom1jmEowjjFkEJlJoxaWPYsZfmV
         9Okz2jPLAKB7q8bscAQUpsCZQrIShKyODYqB3OKbR0/de1hWSMAoxeFaCl1NybqhTDYW
         o7QC2pw9wqGo9LgUJXG9K2AZUBsdkIp2iBePai2EUs/Pi4YqI3CERGQj7AP/Rhl8oGOA
         uEGu3pqG7e/9jVFXeITo9KkQ71gZfGoJJByKTgyx1y6Wj3voqjBgO67svt2K+R7VESMA
         Qjvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771252980; x=1771857780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5Gzjc9tAiUUaqjly2dXlEx81OeXi57C/GyrkWxb8hw=;
        b=heXykT8lBg7xrGYbsZqlj69GhQtB6Cg017EQgKmbXXX+G5c7y8783s5sSeQO5tAqKs
         BuKBj6KQL0gZSAoUoAicUwbbGOGpqaqaAnK/VRnpZdnhCMHzs4Vn05I/azGZrxB34Be+
         PsI9nLjlI2jIBBhIxPw3aheKDGBr0NDr9uYKJ6UjT1xSZxDdNuVGr0GkC3wJplT0GeQ7
         /VlHVH+kbYsSF4w6qOwovwcXgwlAAVQ8JO82f9LVEogiu4tHKiQl/tdE2MPgVCVMwrmQ
         Wg/i4RpyAv/6H8KjRzeB8lyJdtd9UazkE7SkcCV5lyJ3bfHGDtJK17CNCLe+VCSSitdk
         bnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771252980; x=1771857780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U5Gzjc9tAiUUaqjly2dXlEx81OeXi57C/GyrkWxb8hw=;
        b=SlnkuXUgWWrukVD3wNdhouKVMldVfaPt/2E4CYXTAFiGiFx4NTSSde9ZVC7+dlUnZR
         7sYVGbOqr76fD10SNxFdbu72Qnir2UsIGCSg2Ari+seYllK+FY9NSQSyALvByU5ScslR
         HGE2rSBr4txBi+KoqSoYAj/hJWgrJGyg34adYajHLuJmQMfO7baTRDBY6G0FgUKoW43P
         2ZRxlZn4+kff2v61qp0udktP+tQhiL6TyGaFFQEoV0Hn9bdp69gYxaE1BhWsTZmikbBN
         qulhE7Kdd1c5xzeISXcEQYA0Vl5bWXRSSwGEmxh8j/q50UpJcPqwBwgW4qyKmSpaEpti
         tq+w==
X-Forwarded-Encrypted: i=1; AJvYcCW57rRrRA9qHNJbTVu1PCzX+oCuDU/7IWJAwtEpVsZBwz99/prnrlZZuWquew0pool0xfBaRdERHqe4GNDO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1oLFycGVPrdl2U93JmDnRS4XbOxd88/ALzIxUMcFozega2IT3
	+Nvh7cSFjbuFln/iEfeTte0q/mPBXM74xzLlc2ciZR4OwqVERed348vKO3L3XC1SE5t6xuP1UIf
	RRVIlKNKXUXUD41xckb7ZaJTF/1x9d/kLVp8qt/9rkvNY8DTEpBuWiYrhGbSTZOZHTw5dIgT/gO
	2NgeNEWkqJrZ/oWWaNLeOlGU43LDjfVfllSrHQA3spQgk=
X-Gm-Gg: AZuq6aI3fZblIO92SfFvC3xvFszpDCIAYXE6C1n4v1qeILgie4ak7xCIYCpegsSn5/O
	QplDcwKKoKu8ue/g3BhLLfAdrLdAn3gxmS1GewjeUsHHQxZ5rSYsVafhiok8PwhCP3RWYx3BSE8
	P2dzgPEsxm+po+Tm0IoagBsZB7gB6/tURooXWtlvNzwloRn6JDqndAcdODwrb2aGFnF4CjmOBNS
	yTrzElp3sA7bNh5kfFKixFxIKoWzAsTXd8pMNk=
X-Received: by 2002:a17:90b:2252:b0:356:24f0:aef5 with SMTP id 98e67ed59e1d1-356aad5ef93mr9672863a91.22.1771252979514;
        Mon, 16 Feb 2026 06:42:59 -0800 (PST)
X-Received: by 2002:a17:90b:2252:b0:356:24f0:aef5 with SMTP id
 98e67ed59e1d1-356aad5ef93mr9672827a91.22.1771252978817; Mon, 16 Feb 2026
 06:42:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com> <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
 <2uih6xdzarkwnvhlhv5kznmdwo4jorqvsrb7xxrxgr6vprx3ey@4kx45k5i3c4y>
 <6b9042c8-767e-0fdb-9012-f3790899509e@oss.qualcomm.com> <f9f40ac7-e6fe-41eb-92e4-311913567ef0@oss.qualcomm.com>
 <b759fb04-22b7-cd5c-9e53-f4ffe9f37dc5@oss.qualcomm.com> <nb576n2risxl5mabotlu3idmoztedrblur4gbvdlk4cu3mtiqq@ecezsux4w7jz>
 <c3e8b907-06b9-26d0-50a4-e9b091050b1c@oss.qualcomm.com> <fw2zmrpijgzu62jnajqpykplhte2ff3cg333yg4mbb62pq7kem@v2mg7mrf7jjh>
 <8e7b16fa-409a-1980-c19a-b4e1cef4300f@oss.qualcomm.com>
In-Reply-To: <8e7b16fa-409a-1980-c19a-b4e1cef4300f@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 16:42:47 +0200
X-Gm-Features: AaiRm53m6DZu7W-DAPj5qTOuAx2YXr77wzEBH8_ExZX_gFAcMokPLCTA8-q6ZlM
Message-ID: <CAO9ioeUV=TcBUxLmvU_Nq2msaegXd1-L15VgRwp4Mn1v8koz-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=dIurWeZb c=1 sm=1 tr=0 ts=69932cf4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=pE8m3qOa9fn2n1acVEMA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEyNSBTYWx0ZWRfX1NtY00XmPbXJ
 UhwgUc6KZMeKLs7MkINn6++Ye0rg7A3RxB7y/fyx4T0pogj2j5Xpn/xeuToWvF8POW3X2JuKuhy
 mSCo+e8jx5P1XsFb1IEPnU0FvMPWNuT/y+CyYvlRG1pXkwXO2Z+iDjljc35m0YG4iMIXplZYdYz
 ZuBEl+3DxBUhG6jSjJ5J9XfSVjYViEfC9GCoNNZFLZ4PjC+SoAD41iEbOtB3EbHrnXoRHVzvD4g
 1XreY0pVhHVK0fSOGl2k981DIpJUvCsyv73BqYVg6NBDmT0WwrzkRWQzKkLVmOQp59E4z8NWgWJ
 JxAcAp0p5LC8ljUaQ90n4jGg88ck0RiNYFhdw2e0hurd6um3KMN6xHnNp48qa0tSvn6CRoNwmtM
 3lDvSNaiuWrn9qBq20/PtnH9pzj1ET3iTSJAoUJpL+gl8G9nUA9VvCrTwmP8f7HLzlqJz2M2zIS
 OiFUt6RXriOruS68ZAg==
X-Proofpoint-GUID: Hoj2VMsuwX7nEE-1dGzjbg0ROoqGI6kN
X-Proofpoint-ORIG-GUID: Hoj2VMsuwX7nEE-1dGzjbg0ROoqGI6kN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-92982-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: 91DA4144C85
X-Rspamd-Action: no action

On Mon, 16 Feb 2026 at 14:24, Dikshita Agarwal
<dikshita.agarwal@oss.qualcomm.com> wrote:
>
>
>
> On 2/16/2026 5:33 PM, Dmitry Baryshkov wrote:
> > On Mon, Feb 16, 2026 at 01:53:28PM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 2/13/2026 5:34 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Feb 12, 2026 at 06:35:19PM +0530, Dikshita Agarwal wrote:
> >>>>
> >>>>
> >>>> On 2/12/2026 5:13 PM, Konrad Dybcio wrote:
> >>>>> On 2/12/26 12:16 PM, Dikshita Agarwal wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 2/9/2026 6:05 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Mon, Feb 09, 2026 at 05:04:48PM +0530, Dikshita Agarwal wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 2/9/2026 3:32 PM, Konrad Dybcio wrote:
> >>>>>>>>> On 2/9/26 10:45 AM, Dikshita Agarwal wrote:
> >>>>>
> >>>>> The only SoC with such distinction today is kodiak. So we can simpl=
y check:
> >>>>>
> >>>>> if (kodiak && strstr(fw->data, "VIDEO.VPU.1.0.")
> >>>>>   hfi =3D gen2;
> >>>>
> >>>> Agree, this works for Kodiak. However, Dmitry was also referring to =
other
> >>>> SoCs that may support both Gen1 and Gen2, and at the moment there is=
n=E2=80=99t a
> >>>> generic way to handle that check.
> >>>>
> >>>> Also, please note that the Kodiak Gen1 firmware uses the string
> >>>> video-firmware.1.0, whereas Gen2 uses VIDEO.VPU.3.4.
> >>>
> >>> This is not quite true. Kodiak Gen2 uses:
> >>>
> >>> $ strings /lib/firmware/qcom/vpu/vpu20_p1_gen2.mbn | grep VERSION_S
> >>> QC_IMAGE_VERSION_STRING=3Dvideo-firmware.2.4.2-d7a3d5386743efb16b828e=
08695bea7722cafadd
> >>
> >> This is not the correct firmware for gen2 to work with kodiak,
> >
> > Then what is that firmware file?
> >
> >     qcom: vpu: add video firmware binary for qcm6490
> >
> >     Add Host Firmware Interface (HFI) gen2 based video firmware binary =
for
> >     qcm6490.
> >
> > I cannot interpret it in any way other than "Kodiak firmware
> > implementing HFI Gen2". What does that commit message mean then?
>
> I agree. The intention was to target Kodiak Gen2 only; however, the
> firmware binary that was posted was incorrect and fails to load on Kodiak
> hardware. I had submitted the correct firmware [1] to resolve this issue,
> but it was not accepted.

And the discussion points out why it was not accepted. The commit
message was imprecise and misleading. You didn't provide any better
explanation.

Anyway, I've sent a removal for the broken firmware ([2]). In future,
please actually test the files before posting.

>
> [1]
> https://lore.kernel.org/linux-firmware/f5965570-9c49-860d-5de6-bc5a3056d9=
ad@quicinc.com/

[2] https://lore.kernel.org/linux-firmware/20260216144056.524560-1-dmitry.b=
aryshkov@oss.qualcomm.com/T/#u

>
> >
> >> the correct
> >> firmware (not posted yet) would have VIDEO.VPU.3.4.*
> >
> > I don't understand, why are you making your life harder than it is?
> > All firmware for HFI Gen2 uses different version strings (as outlined
> > below). Why all of sudden you want to change that for Kodiak?
> >
>
> Sorry, let me correct myself. The correct kodiak gen2 firmware (not yet
> posted) would have image string as video-firmware.3.4 or vfw=E2=80=913.4.

Good. Then you still have a path to implement gen1 vs gen2 checks.
Make sure that the driver first tries to load the gen2 filename, then
falls back to gen1, so that we don't have to forcefully encode
firmware-name (thus breaking venus).

>
> Thanks,
> Dikshita
> >>
> >> Thanks,
> >> Dikshita
> >>>
> >>> A collection of versions quickly captured from what I have here (for
> >>> different chips, but for the overall picture):
> >>>
> >>> HFI Gen1:
> >>>
> >>> [skipping prehistorical / museum data]
> >>> VIDEO.VE.5.2-00023-PROD-2
> >>> VIDEO.VE.5.4-00059-PROD-1
> >>> VIDEO.VE.6.0-00055-PROD-1
> >>> VIDEO.IR.1.0-00005-PROD-4
> >>> VIDEO.VPU.1.0-00119-PROD-2
> >>> video-firmware.1.0-6804c210603073037fb32640a3dd6a46fe04edd6
> >>> video-firmware.1.0-7da9db401e417a006ef915d6c4323f00cdbcf40a
> >>> video-firmware.1.0-ed457c183307eff1737608763ca0f23656c95b53
> >>> video-firmware.1.1-84a8080bf84fa9ab15b353bf03bea6e548d89d2f
> >>>
> >>>
> >>> HFI Gen2:
> >>> vfw-0:rel0095-d1a9e7c4a274aa13e4136500d19262f87ef2c921
> >>> vfw-3.1:rel0085-070fa3311d9ef968015fee7fea07198d7eb208a1
> >>> vfw-3.1:rel0093-7925621ff52ecb7b1565341042c4e5ffd4fc76ce
> >>> vfw-3.5:rel0040-1ded01d0e6dcaef08b8155fd5a02f5b57248d5ca
> >>> vfw-4.0:rel0045-25b39e81446baf48716df98dd37099a2103d36ee
> >>> video-firmware.2.4-48ec04082362ef1922fec5e20e22f7954b11d736
> >>> video-firmware.2.4.2-d7a3d5386743efb16b828e08695bea7722cafadd
> >>> video-firmware.3.1-e5aea20c64cb6df9a1c9be99e206053b36424939
> >>> video-firmware.3.4-e299f99ffcd086b43a2ccc7c3279ce5df404d693
> >>>
> >>> It seems we can assume that Gen2 is:
> >>> - vfw-0
> >>> - vfw-N.M
> >>> - video-firmware.N.M where N >=3D 2
> >>>
> >>> All other binaries are Gen1.
> >>>
> >>> Also, we don't even have to query the binary firmware blob.
> >>> After the firmware is started, you can read the version string from
> >>> smem, saving us from strstr over the firmware image.
> >>>
> >>>>
> >>>>>
> >>>>>
> >>>>> Can we agree that VIDEO.VPU.x firmwares are hfigen2? If so, problem=
 also
> >>>>> solved for <=3D8450
> >>>>>
> >>>>
> >>>> Nope. that's not true for all, SM8250 uses VIDEO.VPU.1.0 which is ge=
n1.
> >>>>
> >>>> Thanks,
> >>>> Dikshita
> >>>>
> >>>>> Konrad
> >>>
> >



--=20
With best wishes
Dmitry

