Return-Path: <linux-arm-msm+bounces-97584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLn5KiY6tGl3jAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:24:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 578F4286F02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AB7233012E57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6483A3C3C10;
	Fri, 13 Mar 2026 16:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DwVw2moL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="igrTUUzL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205F93B7B97
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773419034; cv=none; b=n6FFqNOqJlDvzgORZ0O4qAPDrXxR1vHob2I9FMPQJ4UKvX5DFKyFeDSmbjXpwjXEcgO2N9WF/FNYmeDIc8cJtz3vV3ty+QWuYgw6pxDHx5NC0HuI+3WTZjjCWhGak6HSdR41JZCREAC4T0+K1M4AFyxsYGDoyD9H1n56GOZmBes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773419034; c=relaxed/simple;
	bh=muDlhZyro/n0dYw1NM2HBqw6mbIJO6udMqpPCjwU5C4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GV4QsIfmYLsgsMHwGIeKUVwXMBUOfnu0S6XCzst/jIXZmhygY1g9ejp0NOGd46bgBWsjgTZOlNkShj7aa4dQgQa9pd5ZAiym3Ii+tTAriFOUoVUk81mncHvYdUq0Ip9o8nSwCYv5JucMUWJ6/vc/XHqkzRWmySwgMYz6MzeylWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DwVw2moL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=igrTUUzL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9B4Tx3906292
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bm2VZJzabmRS6BLmEtwZ6MFH
	HA4bRNlULfqd1XMWDgs=; b=DwVw2moLdnj6dZS2klJZOp98DkCExLjHotxLhTah
	NQ/Z/MGObke0S14uQcCwHX55FJGomiR4cRLP2/hmPbqmdyaVSr/FvFXazqVhkvm4
	bB5+P+6AswMzHK7lR7Lye1t6DifXuZhndJK8+uWSO3pdoEPB66bIjIzUu//uYg4y
	4BDTeCWcrE3m61hvWy+SwMp7E/RUI/7/Di2UabCsfWHtcePXJ6PvS/Cnn4B4a5kb
	Ui3RhuY1weLYiIaRX5JN4ctzP5fzpWzrdxDCRUTPMw/gstaK0lrHwvM8aqTYlbTi
	7Blr642ZXprqyNEQ3WoIVSiANMELaGNimsDupRTnCs1Xlw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfqs9esb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:23:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7c4ab845so1005151385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773419031; x=1774023831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bm2VZJzabmRS6BLmEtwZ6MFHHA4bRNlULfqd1XMWDgs=;
        b=igrTUUzL85374xyHCjg7UaIehe7MLt9s0hIAhVbJsrnQCQgk0a4QuwLtWlgkg7e6sm
         7fWE3JGvEDA8yc9bx6AeOS36kKLepEmf6C7KTbznXrWptX+hekMT31082xd7kSYjKBX/
         PJuZ6O8JTd+cRScG4lxjttVga5lON2vekwEUwds1Ne7ImvYgWCJwx03gt3rno7+ntlCd
         ChndZtk8JzpUJyP6DlP+jVq/p/s75938omoT3MFAWGWNK4L+NtSS1vs/1ZI6ZTwtFkxg
         euWLIZFPumlxZm3D6vDj/ovVWllPkMEPi2MFZ+SqJ6GuxaNYjdAXuEJM/NcCsxyfHeu6
         cpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773419031; x=1774023831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bm2VZJzabmRS6BLmEtwZ6MFHHA4bRNlULfqd1XMWDgs=;
        b=ePae8/9Kn0aU3rBKhpS22vqGJGkgZfnDc07YxhR9oDVvDrCcIR01NgTmEgXzwl3SuP
         AHB+GME6QS7dnbrIzz9DF/ThLavPrMba6P2LoYSe03Sb6S6UtK2VUst2czVD+DHh81UZ
         dF+VVHJRLq2vEtZRoRW6OO6gIgMOLo5zRsTkcvQdGgqWFMPEnSJhSbOAXkr3XlySJFrC
         hja4iwskZMhN2uF0Ibazt1pGLw1Mm1CLEzrycavz89fMDOKlv/XTcBWB6HOtExxLxyqr
         KGMlyLUz6qa3aRkwWu+VB+6q808TfFu4o9rgYX0t9yyKwX1rKKzKvy6XOftQ9J0ThY4v
         pYFg==
X-Forwarded-Encrypted: i=1; AJvYcCW4WAGp7B9oufTL5p3I/qUZ4iMEJoYWEil9uG3G4zrDONuPLpYK2ymosvFMEMuaCDNMGuTPZ8OO38q0GLa3@vger.kernel.org
X-Gm-Message-State: AOJu0YyF1Iw6leJO0PrDWkVAfrp1poxCW8PV9fDFywnZj5fn/dQ0Mh8j
	8QZarEnRdDEeqqxvsNym9pdQT059p6GMH2++xZvJD+fUg0tSb7XAHhlGndRZ03pwpZS5gpIN8tF
	XQGPNXPiCu7Pr+rspc6SYUIVCcigifpdkynYHVh+BzNO2sDnqd3vXLBYJ9iJFpO+wMFjD
X-Gm-Gg: ATEYQzw+OZA8zKEwCygvErIzAgc5NTXJRhJ/fFB5d+7+xg0/KU7eCdX7Mznmelr1ntT
	mwv/TLg7xKmz4xr3hYBPNEjbUJlUpZPm0vJt4LdKBFnv5W0PvIjSQd/mNNM+IOty9nsKlwu2L5I
	jKN1UwBidNk2lqKANzmxeeW6tPwxIkIctshPqvQbySXiQqFQ9lajw9GtS5WymRJip4B+V0mTPu9
	WuGEsfQJnp89C4MATfU6+JT9nNy+p9R0fbQi7tqaeAjGVScLyeY3nS+0UcLIauWmowmKp8WZSVq
	UV7YnB2vBEc3GgwTuz2sTne2DBcjfi5LquA2Rqw+QYKPGgWwzbN+9Dc3Wl8YjMu3tKLaNROWd4h
	pmeLHMVX2WCujPhkDLKoVhNm274WsWm7s4yn+vHWWDKoxhXsmlq7Rj3k9uF9XBlNRvE6z+VukIN
	hPXRw05yVX9o/eTfMHqYBDd6VwTgmAoUZnN8E=
X-Received: by 2002:a05:620a:460e:b0:8cd:923a:8798 with SMTP id af79cd13be357-8cdb5a70ff7mr523290385a.20.1773419031322;
        Fri, 13 Mar 2026 09:23:51 -0700 (PDT)
X-Received: by 2002:a05:620a:460e:b0:8cd:923a:8798 with SMTP id af79cd13be357-8cdb5a70ff7mr523285285a.20.1773419030798;
        Fri, 13 Mar 2026 09:23:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f353e1sm1574765e87.10.2026.03.13.09.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:23:49 -0700 (PDT)
Date: Fri, 13 Mar 2026 18:23:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        r.mereu@arduino.cc, m.facchin@arduino.cc, geert+renesas@glider.be,
        arnd@arndb.de, ebiggers@kernel.org, michal.simek@amd.com,
        luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: Add Monaco Monza SoM
Message-ID: <erzhoze5gzxlrffzgaxnyt2lx2s7hicvxg2bxy4ydvo24b3g5r@hbdqospl4c2l>
References: <20260313103824.2634519-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260313103824.2634519-5-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313103824.2634519-5-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: wc3FuW6mUI6zDJ6kdwku02GxLiWbfJaJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEzMSBTYWx0ZWRfX1TRaE5HwLOsi
 iUp+D9w3EvlKbSUaw2SmdM+LUSiug6pKXFEmwtnDEZCYoU6B+y87tsjIVNZO6LJgDPBtXMv2ovc
 rbZIhDTsRjXMAvw6purTDEHTl2rzzV0wbIFyEY8px1/UmZFpyM6p1mOh6+jqLvdDh36SHVJmZ+r
 oVOd0jcOxvy3WBUCVDizvZxLNg/fZcB1caq81Z1ipn7+A7oRqFET8AUVRKqTHgwTmODzxywTXL5
 Dt1SSzcrvUTNkSfjbBxJ4uvh5ujXlUh3ohUA2jtlluZaKfqTP0OdNWy0VudXx8IT8R2PACEjQcz
 o3hwmZZZPVjaeKvWDnURLFHbow/bwNPQJfIitiSaNpyn4+flqPC9EjwIvpbIg4fBC7wmK5SlcVb
 V26bot2sq3I+auiBmBpnzxwpnKKZl7bxKNHK8rFAV5rOUNePSwg6U79RyoJTFo+U25nN8GA9Aj+
 xubOlnswfI5pHTIA6UQ==
X-Proofpoint-GUID: wc3FuW6mUI6zDJ6kdwku02GxLiWbfJaJ
X-Authority-Analysis: v=2.4 cv=GoNPO01C c=1 sm=1 tr=0 ts=69b43a18 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=PhgHo22kut4TJJxNvVMA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130131
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97584-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,arduino.cc,glider.be,arndb.de,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 578F4286F02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 10:38:19AM +0000, Srinivas Kandagatla wrote:
> From: Loic Poulain <loic.poulain@oss.qualcomm.com>
> 
> The Monaco Monza SoM is a compact computing module that integrates a
> Monaco/QCS8300 System on Chip (SoC), along with essential components
> optimized for IoT applications. It is designed to be mounted on
> carrier boards, enabling the development of complete embedded systems.
> 
> The following components are described:
> - Fixed S2S 1.8V rail
> - PMM8654AU RPMh regulators (PMIC A and PMIC C)
> - Display subsystem/phy supplies (DSI, DP)
> - Enable GPU, GPI DMA, IRIS
> - PCIe Gen4 for both controllers and PHY supply hookups
> - QUPv3 firmware declarations
> - REFGEN always-on workaround for USB2 HS PHY
> - Remoteproc firmware names for ADSP, CDSP and GPDSP
> - Ethernet SERDES supplies
> - USB HS/SS PHY regulators
> - On-SoM eMMC
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../arm64/boot/dts/qcom/monaco-monza-som.dtsi | 323 ++++++++++++++++++
>  1 file changed, 323 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

