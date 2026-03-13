Return-Path: <linux-arm-msm+bounces-97296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLCBEdF/s2k7XQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 04:09:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8A827CFD1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 04:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 471133025739
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 03:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA17331205;
	Fri, 13 Mar 2026 03:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QH/hWQEJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZB9/a7XZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6C21EA7CE
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773371338; cv=none; b=bapyaEOkCDyTHPOXj6bxskXCGAuPbkaqNOwq/JZDDr2fNEDGrpDFlSffxAdTM0Lo1+W7qTS7e8RP457/ClcmX9zB2Qh3EtErS3tnAa8PZ2HFZFgMchqRIQlm5rG1lVQ1Q19stl/Ie9CX3u4u2MeAb/WJf3tA6ZIh/0633HnSQeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773371338; c=relaxed/simple;
	bh=6cR51DdATLcTI+rP8Z2E7ZCpXPUy2swyU953xqGq+Do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l1ItuIpLevuPfaH7bh+Kbto7AdK9Hp0rYOW2wNx/XjgeMFqSl+3o9CYlERZK4vLK5O9ejmgC1lfP0++/rAdtfeJ5d9XGWSQ5kW14/bQJS611NaObY6OMvjtz3vbHXrfwQpCClP1lS4FZTddVahGLLagWUG2WxcpIGczD5GkU7hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QH/hWQEJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZB9/a7XZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D17laR2612593
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lksbg6wIDbhx+jwPXYo+XIuY0vnuKnwrbrkq7ySL1ng=; b=QH/hWQEJWLsJ63eL
	K7Xdm/HiUzRI8+7E2ARIb31RUFG2VyeOb0WBB+tdjYk53Bx1y5nTX9cgoCMv6hMF
	D0S17ujr+VTKEDs2UkXkK6CMRDK0Ccz/s9VNke5YdxLx5UhA8osW1pcjKvICS149
	1zvLdbo3BiD3UQZKUvOoTdwwDTEvf6E96Z8ZNwP3AGFmyU+/4KOevhb8gU/3egXe
	4Od4eb1F0vWROhiI3iHt7i+6la/qNL2FkoqcqUKahLfcxsteBx/ohtJ3fGNhSom2
	utsZvnZaqQGw9bdV+jWPfBXT/MKNW4zhYishoASqi78RMjjFvRF8eVTOKQ3+5j42
	GVFi6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7g9sq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:08:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cdb995a1bfso188527185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 20:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773371335; x=1773976135; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lksbg6wIDbhx+jwPXYo+XIuY0vnuKnwrbrkq7ySL1ng=;
        b=ZB9/a7XZmpRz4V8RWCMj0mYQV35Qo2AeyRds76u1XgMpzbvj9Y75OORahz+ldcnxZO
         Hn3iyHtpegqq4f+fMFyIXqNnz+RME6G7MUKMoR85pQF5PLpuM4/QwxbbWyWahUCJjxnC
         fsin1yH7lJUd72RFSX1TagmtGVI85EhQThD3AF5/K9IW7VlAoD+WYjkBAc/U2Ktx0ge4
         NDm5/8Cwqp2HmljwRhQQIUqPVCqSpl79dVnewFMsvVJuGpBpBbRhwVlOB3+9gL/WT8S+
         4Wqwp3/l2IvdumwpEgsTOt7k6iD7tIWX1GarUUjk/DaCeRzTh8oMlwWtZr4pocW0K6Ei
         yi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773371335; x=1773976135;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lksbg6wIDbhx+jwPXYo+XIuY0vnuKnwrbrkq7ySL1ng=;
        b=F7CE/ttj1+0IVDdqtIX/gjzbGc4OG5zpTCbxOEjCp9LJmGvuhIqqxYphAElEcadHXt
         eO7Vzmv/LRa5SnW5HeuQBVGYBPKa8jept6kd7mCnmYG+Im+aYBoTDdRN8jAcOaoG3ORq
         6V71huAji4WkkbwmmKB46pCGg0t4aw4qc61zMMtqk6bhd2kxQw59+QNN0Dh2XO/k65KO
         sfFKygEe+99YVxxrpPu7ZJj9yUMrzCFGXKI/KpU65Z1n46S7m4zZl1eny0hMNGXIjSJ0
         Vzwh2Yjn/muXc7AgmAcXc6sBHyGmxpkyay4bn8bPok2KMGAa9Mz4euBk4H+20TzeRKM3
         0lqw==
X-Forwarded-Encrypted: i=1; AJvYcCXhV+eNS/dKBPXg4MJFwxGn4JXwQyevJWy6jq4O3PpuWJ587u8NNuGghNIImsRzzo5OW3D0l0xR9sI/B1z5@vger.kernel.org
X-Gm-Message-State: AOJu0YypuOmwSf9ncpX2krhPYvHHYiG6o0+AyafV4jWmZOIiZ+Mc1NU8
	Q7rTP8Lg/GnaSvwmqtmrUHgwMhb5oXuAIrMGPDCuCrh+lYoKeyzTLptgYE+X9tiUB/HiNXUOzEQ
	a+LtNW1a5SF+Hv+tVb0ODwXgbVmBB0QeQQEWxviwk2JoYMQ6J5vWuccvXwUPd6J6ko17p
X-Gm-Gg: ATEYQzxmdPWVNOc7TD0SjIbz6gyTlu6kV4VSGyE6O/WQkSwugv1b0rR1GMyYgVJI6/v
	cPlc7nztBs39zh13eVrHWyNqWyGZJjL6x1gInqioj8xAPGexy9KZOjPz95uzlu8Fr4psTqa/As7
	QmRwfjIqG3STWkKwOO0OKp516vNdiA/jK9BGqpFe3loKJvYZz/K/Z1XHkberV920coz+9Sa478l
	qVwm8CgszK8mnu5MnqyM+XhsvOP2vU+M9WVtRjCjwp2jAk6O6PM6qAc4+1oF5g4v3qncIX03xOx
	TDuxulBWZkqZSoMoF8Ab+80RulFBBzd3O87sSvbpiVZdjiV/2TPh74DgS9oXEJYhfT5UozJBnaO
	eGQPz3woB2XOAw9mnILdtHz58jN7KD8n+XhL2SdzASI8g3ewKTSSNeXgByMwzbYWj5/ZZ0cCIHX
	oHmtTxHdyWe3qCrYYwSjwCD8T/pjw3iSDRM6w=
X-Received: by 2002:a05:620a:40d3:b0:8cd:97a7:a343 with SMTP id af79cd13be357-8cdb5aa4d3bmr276631985a.36.1773371335505;
        Thu, 12 Mar 2026 20:08:55 -0700 (PDT)
X-Received: by 2002:a05:620a:40d3:b0:8cd:97a7:a343 with SMTP id af79cd13be357-8cdb5aa4d3bmr276630085a.36.1773371335022;
        Thu, 12 Mar 2026 20:08:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33d2dsm1270531e87.16.2026.03.12.20.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 20:08:51 -0700 (PDT)
Date: Fri, 13 Mar 2026 05:08:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: disable WCN6750 and WPSS
Message-ID: <to4od4msbgipx5jwu5whddjhqmlokwhlwgbrim2xgysf46cggz@wrfp7xlxr67a>
References: <20260311023219.2284643-1-hangtian.zhu@oss.qualcomm.com>
 <20260311031145.2285056-1-hangtian.zhu@oss.qualcomm.com>
 <wy46mrybpvnicmv2aljkyh6lu2gnzz4axl66r2efmfy6pr55b2@phsj7pghzd7r>
 <7aff8a49-ac47-4d93-8028-2710ba4eb2d7@oss.qualcomm.com>
 <igjdwtp7ox244c4iqh6t3ilqvxrh6ann23m2lo5m7daxncyffa@e6a34rl74kln>
 <f5758d4c-d3a0-470a-9dbd-0003684805de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5758d4c-d3a0-470a-9dbd-0003684805de@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: YgZGqQUcEk17epFszScBoeGJUXnFRP4U
X-Proofpoint-GUID: YgZGqQUcEk17epFszScBoeGJUXnFRP4U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAyMyBTYWx0ZWRfX/U0yvHXw45P0
 HXFKfxiNZE2VyxpAqIUPpKGUYYO1mUjleK2fPH1hwNDZD0X+NZPru0MjOKpew/Gk+XzdjPeKAz5
 7aOHtmqPOkp5XZigHr5JvE/BedgWZTKeZJ7sX0tu+TIGyCpdXuLcMgFNQ3C18hUqfYCn+ASixIr
 m8eNLJ2ja/StyoQ/I24EtXNWL7GECJtNFv46GyIBWl5JQv3dyPXGRhzyQAEz5mrG1ZHC1POztmd
 /naCFJ9jvkqQv72eDDTODTfaLlCHQ9F31BlH8Y7aDPekMJy7crbSAI/3W2ENcWuFNIw+0mRjRmN
 ohoDGU14Q45SHbokDmfMCqnzQa/DC4S5PUPSio+DukBRW15qjNJR1FkcJF7YBiH4QTP8b6UaSiA
 ylrabd6hdrlpzYie2yzC0NPwaP829GEUOhICblc4IeiAnseSLgmy1xTUzua22v2pxKWbkel0UNw
 qmGbdX2Wjb+d8DuCe5Q==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b37fc8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=59eVtsANkpnzl9P_E48A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130023
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97296-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4D8A827CFD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 01:08:56PM +0800, Hangtian Zhu wrote:
> 
> 
> On 3/12/2026 11:04, Dmitry Baryshkov wrote:
> > On Wed, Mar 11, 2026 at 03:06:08PM +0800, Hangtian Zhu wrote:
> >>
> >>
> >> On 3/11/2026 12:34, Dmitry Baryshkov wrote:
> >>> On Wed, Mar 11, 2026 at 11:11:45AM +0800, Hangtian Zhu wrote:
> >>>> From: Hangtian Zhu <hangtian@oss.qualcomm.com>
> >>>>
> >>>> Disable WCN6750 and WPSS on industrial mezzanine. On RB3 Gen2 industrial
> >>>
> >>> You can't disable these devices on the mezzanine, they are not a part of
> >>> it.
> >>>
> >>>> mezzanine platform, pcie0 lines are moved from WCN6750 to QPS615 pcie
> >>>
> >>> PCIe0. How re they moved? What triggers the move?
> >> Please refer to: https://lore.kernel.org/all/20260305-industrial-mezzanine-pcie-v4-0-1f2c9d1344d7@oss.qualcomm.com/
> >> On RB3 Gen2 industrial mezzanine, WCN6750 is not connected, instead TC9563 PCIe bridge is connected to PCIe0.
> > 
> > THis doesn't answer the question, what triggers the move? Is it done
> > automatically? Is there a pin that is sourced by the carrier board?
> > Is there something else?
> It's the hardware design itself. Industrial mezzanine (should be called 'kit') is not a plugin device on top of core kit, but a non‑modular integrated device.
> Hardware redesigned QCS6490 SOM and disconnected WCN6750 from PCIe0 for this device, PCIe0 connects TC9563 PCIe bridge.

This needs to be explained in the commit message. Mention that the
resistors on SoM are soldered differently and that it's not a separate
pluggable mezzanine.

And having this in mind, this _must_ be squashed into the original
Industrial Kit / Mezzanine submission, together with all the
explanations.


> 
> > 
> >>
> >>>
> >>>> bridge. Hence disable WPSS and WCN6750 nodes for industrial mezzanine
> >>>> platform.
> >>>>
> >>>> Depends-on: https://lore.kernel.org/all/20260305-industrial-mezzanine-pcie-v4-2-1f2c9d1344d7@oss.qualcomm.com/
> >>>
> >>> NAK. Don't invent non-standard tags.
> >>>
> >>>>
> >>>> Signed-off-by: Hangtian Zhu <hangtian@oss.qualcomm.com>
> >>>> ---
> >>>>  .../dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso    | 8 ++++++++
> >>>>  1 file changed, 8 insertions(+)
> >>>>
> >>>
> >>
> > 
> 

-- 
With best wishes
Dmitry

