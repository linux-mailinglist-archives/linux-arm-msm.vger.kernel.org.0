Return-Path: <linux-arm-msm+bounces-103333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEeCKidf4GmafgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 06:01:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 604C540A210
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 06:01:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 438CD31CC31E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 03:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA2230BBB6;
	Thu, 16 Apr 2026 03:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I3fgfGpN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fhBhLdh2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2E52F8BC3
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 03:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776311781; cv=none; b=HhKEEwzIVRtzl1JDf/UC2yqZ0R2EN/Jq5Cmm52+/i+WZfKEDbWBIBUIs2jcZpb6qO/AUb7PeK4gbTjn7QuXpiBf/2V9NeBwLxYf9aNJUYhK2N/AncvlaY1qHtVrRquOXOikeWq6W8NgKNO/uDVvW61uOtoCPJgZ1E2UcjO7syGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776311781; c=relaxed/simple;
	bh=uwz0fvpWfhvq8MOkXal8gC9IQGpwGaILi7RE77kf0Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZsUxyCs2MY+2d4Rbj2k9W0kvoc/ipFxAEUib9IQFXqN1XGOgME+4LI996E66bUmIazTKP2QVjVh9sIX1hIvPA0/NcCUBEYS6PBTYgdMcImeizdkXuLKWYyhHj5UQK3B+uxidST21WtXZ+O9NuzE/a/fDJE8lNawVvdKRUGmQnUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I3fgfGpN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fhBhLdh2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G0qEaA862439
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 03:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z0mSg/Q5laBgqrl55NAb4sQLuRFhkqqVxNqnpYrWK9s=; b=I3fgfGpNfuhGFU1M
	oTpB5BJmXB1TR3qxGPD8qi9bMyvALGf7E8Us1mMzteZA+WS8Mwxq/OUyCpredd3Y
	z7lZ26J5LEjqanGsxmPpbzxwMmtzBLZmbI1YNiWFojKUowu1AUweiEUFXI5sTW1f
	5JiL/qDdjZV5zvO7jD3h4i2/JPFkdKQTXfKeVzVbQJM3LBcPrGbkWt3CrNZVxrx8
	AyjwbHZ4uwnUSqYeg231+wJg0Zfv2WCHrk5JKa1AwHuNk4SFyUYjIMPcd/Mk4UFr
	okgLG418R556J56Oln/ZyqP2r82j9Mz0/sUh/gpymqklhDmbq7/AC1b6zpGjbQjF
	4h1A5Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djd0ea4xx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 03:56:18 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2da19227bc1so14817247eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 20:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776311778; x=1776916578; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z0mSg/Q5laBgqrl55NAb4sQLuRFhkqqVxNqnpYrWK9s=;
        b=fhBhLdh29vfew7PdaVYwnXTK+P8AQV+2Hq0O5Wei9kjltzeMO6U6bj/50/oNYDyzsx
         mg+w1GTHzP/U6hzpl3ZOztXl2EIac2nn2N5HYkbQb1R18BT8AKvWsVEMPnEPjCw3U+Nc
         cpnrdRYgg0DskhcOdbtkSNvQTmuPYFNzOWgn742bCUkpeV2jC0ddu67Ej6HgYTZdvjS2
         cW/DW22vM7YE8w10AvsQRtFMdTH0Kef1+dXnmKGAR9r+2HENyEacAZyF27hUmUoEr+bv
         1e3y95Q9LEenUTh6mD+6hiHUYsi0XQC/xGJVs5pK2ueYMdY4znUTEdhNiodPhQM5wieU
         Vv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776311778; x=1776916578;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z0mSg/Q5laBgqrl55NAb4sQLuRFhkqqVxNqnpYrWK9s=;
        b=srzTCwuAhHvkltu8I366YEJpFN1TlkFxY7e2FHYk1heWzMJ0PAVmsVnIgZyaysaXeo
         ghdBeT7bqDemWWsiCA9Ol5zTR+goa2+1vE0R5B9XNBbgRf7p9pLZQbT9cbxm3aF0v22n
         Ss1CmNLIYCryzN9t3lZM8WRKD2CmBlq0zusPhPzHwidkiTpvnMbN+Olp6jyN70jKIL/z
         PtbTlKRBFYczExjZnABHD3GkrcKkPJdgXME4FZXRDpARPOXlhMoKpjJL1s/odwnE6oUc
         WKcK+DiewwUZzB78btUyimCuLTtOx66y4zOtaPtr5iweqsLkdfNzSJWropxKEQz+tBkv
         EPuA==
X-Forwarded-Encrypted: i=1; AFNElJ8RZ35vtS1d50U8hPFrCzqxg8+mj9v9ehveRMS4vF/S2UvwUWYkQiO7AcTrmJ2mXFnXAwW2M8rJcxUwsILx@vger.kernel.org
X-Gm-Message-State: AOJu0YyKQetJBRMhEPjBdal09OnKlMZ/lL7IWQnFBoEeQ88O0PPHotn/
	lzVl1+lnMJ4mEjcQRiVAAR/zalVag2b70KXToi2Dmt29R1hnSvvCJ+2EIqgA7D74DYJ1bDpyYT8
	rQdnOJ1DJ6pA+IGdI4vYQMyBTDdT0vdFAyMRKk78u8tSMuEzzAYPi/xEZLrBlwAeusdgU
X-Gm-Gg: AeBDiesBQk9MMv5d5JA//xTzetJFKS7/eFqAZSn9qLV/aeZlJOkqXZIQXzMk/RptqtF
	OBjNbq8ARE4eEW/GW4VW6yW5AKRiNEFLifmsXI8QP6LVc015CQgM+w6A/dniuWTvmj09e4gjeBl
	leLG7F1ZX1zqBdUoj+n0oBUEL4X2aLu4M5c9xF9daNMZ8L18xCro9Wqnpls7hodRfHLfE+3gj80
	aYyYZKR9yGKz+C57a1bvz9HpS9nZ+3aoxQpN1aCK62y2M6XyTyWEtCoJ1Mcy71n9fSjpwi5JBev
	Rek8wqtCi7Oo++98HfDSiaoJLttdyaimkJQ1qI4XrPGg8D+VMrKmR8zm5m7UKBKz8FzcdOXAe9o
	9VHUg8J4SLAOjnBwnWqKWOOIcB71zED7X7fBMTEeA5hXfJb8qg0odGy/FnkqwbixtyrFpVwM1gB
	iLXZw=
X-Received: by 2002:a05:7300:c90:b0:2d1:a3ea:d8d4 with SMTP id 5a478bee46e88-2d586380b1fmr15379463eec.6.1776311777932;
        Wed, 15 Apr 2026 20:56:17 -0700 (PDT)
X-Received: by 2002:a05:7300:c90:b0:2d1:a3ea:d8d4 with SMTP id 5a478bee46e88-2d586380b1fmr15379452eec.6.1776311777401;
        Wed, 15 Apr 2026 20:56:17 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c606222sm7203340eec.8.2026.04.15.20.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 20:56:16 -0700 (PDT)
Date: Wed, 15 Apr 2026 20:56:15 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, johan@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/4] clk: qcom: tcsrcc-glymur: Migrate
 tcsr_pcie_N_clkref_en to clk_ref common helper
Message-ID: <aeBd34EYQkp4Y9v6@hu-qianyu-lv.qualcomm.com>
References: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
 <20260331-qref_vote-v1-3-3fd7fbf87864@oss.qualcomm.com>
 <ebce5979-0ab5-47ff-963e-68e27216821d@oss.qualcomm.com>
 <ac306hTHe3qVORk2@hu-qianyu-lv.qualcomm.com>
 <adem2WKh2B-Leivq@baldur>
 <adyV7qKQL+SJ6TxL@hu-qianyu-lv.qualcomm.com>
 <3d4a12f1-a9ba-4955-b018-f1c271aab766@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d4a12f1-a9ba-4955-b018-f1c271aab766@oss.qualcomm.com>
X-Proofpoint-GUID: 8C8faKKYtYK1JrbRf2lfBAU2UMlcecGD
X-Proofpoint-ORIG-GUID: 8C8faKKYtYK1JrbRf2lfBAU2UMlcecGD
X-Authority-Analysis: v=2.4 cv=GP441ONK c=1 sm=1 tr=0 ts=69e05de3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bHU4chEc-QCxAg9O244A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDAzNCBTYWx0ZWRfXxK93VDRfu2ec
 h+HOd/jG5M7WcccaVk7Fl2ckLMXol6zgJhiLKwqadbMaxQi6dr2SYpvwWsvEbq72AoGz1AEpkSs
 Ca/wer/WB+ghaKBUokS+iYN222LUsRFd974U+Gx1msE3EkNqvGbeOUVD/oWw0HsxkTwKeFQoPXs
 mS3DqQdbDD90twgoB7zzfqksw4XY2L7hldEmNWFelzW4b/XfHk3lKIrXB/0RZJtgUEm22QjvQLu
 dXNqqsKfOxW1AajBsZENHHRCVpb+L2568CW77xlcNK0zqiHm7/yzLZ3zQIjLNZnKLK6dQwBF3eH
 8pKKkcCwEyHJmwy85NapMQJtDu+5NlQv8OCkG4MN1Is/fdyEiIOWY3CUxQIkOvr+UIM47AhFpyk
 1SHlOH8bPQ4FiDHh7kKy8Lf78KPBOEWR3vmK+1ps4QHk2ItG1cMcQ++CO8I90TG8RgV6i6ngvcI
 qx5ab3OdX5OKC9BEjLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160034
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103333-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 604C540A210
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

++ Wesley Cheng

On Mon, Apr 13, 2026 at 01:18:16PM +0200, Konrad Dybcio wrote:
> On 4/13/26 9:06 AM, Qiang Yu wrote:
> > On Thu, Apr 09, 2026 at 08:19:41AM -0500, Bjorn Andersson wrote:
> >> On Wed, Apr 01, 2026 at 09:47:38PM -0700, Qiang Yu wrote:
> >>> On Wed, Apr 01, 2026 at 10:05:12PM +0530, Taniya Das wrote:
> >>>> On 4/1/2026 12:05 PM, Qiang Yu wrote:
> >>>>> diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
> >> [..]
> >>>>> +static const char * const tcsr_pcie_4_regulators[] = {
> >>>>> +	"vdda-refgen-0p9",
> >>>>> +	"vdda-refgen-1p2",
> >>>>> +	"vdda-qreftx1-0p9",
> >>>>> +	"vdda-qrefrpt0-0p9",
> >>>>> +	"vdda-qrefrpt1-0p9",
> >>>>> +	"vdda-qrefrpt2-0p9",
> >>>>> +	"vdda-qrefrx2-0p9",
> >>>>> +};
> >>>>> +
> >>>>
> >>>> TCSR clock refs are just not for PCIe alone, they would have supplies
> >>>> for all the ref clocks. These supplies can also be shared across other
> >>>> clock refs. I think it is not the correct way to handle the supplies, as
> >>>> TCSR does not have the complete supplies map.
> >>>>
> >>> We have complete supplies map. You can get it on ipcatlog. Here is example
> >>> for other instances eg USB and EDP:
> >>> - Glymur (eDP): CXO PAD -> TX0 -> RPT0 -> RX0 -> eDP
> >>> - Glymur (USB4_2): CXO PAD -> TX0 -> RPT0 -> RPT1 -> RX1 -> USB4_2
> >>> - Glymur (USB3): CXO PAD -> TX0 -> RPT3 -> RPT4 -> RX4 -> USB3_SS3
> >>>
> >>> I only add supplies for PCIe in this series because USB and EDP vote these
> >>> LDO in their PHY driver. They can remove them in PHY dts node and add same
> >>> regulator list here.
> >>>
> >>
> >> The regulators are reference counted. Can't we add the USB and eDP
> >> handling here as well now, and then after they are voted here we remove
> >> them from the PHY?
> >>
> > 
> > For USB, I’m not yet sure which tcsr_*_clkref_en each USB instance in the
> > QREF diagram is tied to. I need to confirm that mapping first, I'm
> > checking with Wesley Cheng.
> 
> I think on at least some platforms the reference clock for the primary
> USB controller is not sw-controllable (so we wouldn't get a handle to
> toggle the regulator this way).. please check that
> 
> Konrad

