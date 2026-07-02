Return-Path: <linux-arm-msm+bounces-116026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8lCpEepfRmo+SAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:56:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1956F7FB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:56:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jwDwHVIQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Z6yN9UvB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116026-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116026-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65E47301FF90
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 12:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAEB480DFE;
	Thu,  2 Jul 2026 12:43:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8EB480DFA
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 12:43:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782996237; cv=none; b=W4cSLmDzAord9rYBBKzc96UNVLxUVwKWpjyUiobkQ9idlvzkvPV5RmrhhF/Sj29F6t1NWX+MqPmCM/yZ5kr4rMsQo/igm4knCxkR8yoA9pgxZgJ0gDEd6BQC4W5Et4kzrG10fHy/q8ovnH6VRGlupSyukGbueihmINPkSoaTQjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782996237; c=relaxed/simple;
	bh=ZwSUjDqury8+040NfR50NEd/JXixD4yQhums4YsHLU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6r4I2HMcvJ55c+cEKCaeNUblMl7FXMvulSUl1TT9rJP6QiKG5t4DV7EM1KdCODACxjR/vBxYxLgcN9CVW1MqxwQCBsYJ/LN8M0pIY0jz6K3EFnU1y7DdWBULh9SnXXrm2+3dNYOqZHH6yntCgjEPYEsZnKNfTWimav2oyxMewY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jwDwHVIQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z6yN9UvB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662C40JU390549
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 12:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=91xTeCDgDMznnkaPnmi6aYI4
	VoclEpS20yfV9BeMa0Q=; b=jwDwHVIQxXw50AFlDuREeUcMADeBBklqnfT7VIt3
	cNKZKUAaRygNSasaTxZnk3Tq3aGRitRGiBaZeEB0TUeF4SgKJI7Or5dl/iLpmsHL
	Yp6xWISjEC/cV4Qx56fxooummh3MShK17Ux1m8GUTxI8zPal/Dpj9I4NBVut+mCk
	PVfgRU89SExcC5UJKRUP8sCNgx2zlzn5eru/zqRHq2AP31Baj/YN98JKjfG2ZwWN
	J4rsSKWPEJ5iQ8ySy3CO9xMRVdMzHp2gUX20X1VyVFpfh44s0+kgNuYD410uE4US
	s/tRg9uWOE5ikfoIoPe4DFivQ9LU3DXfVbldrC1iPaidUA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnp85rh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 12:43:54 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bdad49fe15so1314125e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 05:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782996234; x=1783601034; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=91xTeCDgDMznnkaPnmi6aYI4VoclEpS20yfV9BeMa0Q=;
        b=Z6yN9UvB5b2mT/Pt0d2p4YM+z5USih3DkTzXQQVxZZfrTtdfLMTDAS/Oemsko+b9uW
         VmeCdiEvZgI4Tc7YOZUESN92zhJpOgohOGYB9Y89tDTBtVFo9BHn/RJzNaJRw8EFFte2
         Eqz8XG6OB0IMKqcgWw/n5OfFcq0ty73MGvpKORuc8ufHG2Hhu7DqkeX9CUm6AIjSnVUH
         KKWKMqLmF2pHg7h44IXHnVraChDuB8Z/hk19qoSreA+x3KnuugY7tXf14XSC9zMEezVK
         f/HsMRV4OJdQUndPbp1H5MxXvUo2ZUCA685VjBP0Raf2No2B9CDNDzOh8pKgtxg8mXol
         NOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782996234; x=1783601034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91xTeCDgDMznnkaPnmi6aYI4VoclEpS20yfV9BeMa0Q=;
        b=gKu7z4b3FO7tB3vOsjHqaW/+wZruDEoSuSEzrHVRuq8ptf1VTmoy4RsvUTo24x7+4j
         UHQlzFt7A49qZmxYXWGcDQMht0jdnFhCdDFGh0m7yMc3fC2P+DNIuVlqJg5971k3zfEV
         EpYBVn4mz36BW5aJv42AvNMvvrfgpGJ4g3kYaa/HpuhFZHj8Emu5s9tIOPSfI2eeMgGE
         Jh5nz/taNVSvGb2oQe/GwP8T+eYSpToi84A5sBxOO3iAzfThZzGmPVqiR3ZyPi2upFcm
         6faqPrkAd5atUxkCD4+fDHTLUh2gpuYH4ldYpO4GHY91kX5/1KVpr9k5fqI0Lzy9BCc4
         8oAw==
X-Forwarded-Encrypted: i=1; AHgh+Rr5+RghTnTffTgBnD+bUR84ts21IU2m+FJuoX3Xj+ihCRFvGxgrDyXgtRiv57Z1v2cD8Gwqw4SHyf4py3+J@vger.kernel.org
X-Gm-Message-State: AOJu0YxTgfrnOg26Nq4nzhhUkHuSEgBjUOYYW8pmDouQyn7WosrxSk6a
	OmOffbRVQ54PJnSnR/HqJMGSObn3py7kp/onmnhUunKl++eSI3Bt46I1uVeLl3psbC5ulNHi5Tz
	TqAknUeCbIwmtN/MV5/xK5J51GxdC7SoLDrj2252KCdffASg0V8MVj6xY2ZYm4CDnWYTh
X-Gm-Gg: AfdE7cnmFZAPUqLOUH65qWOEIKXMgcR7nooIozRaMWi6b1G3Z3xzAE5mMvDNAp3J1ZI
	vJ5Y2hcvqf+EFnT7MgbOImqPAZP/xce1VQzdTB6srIRGi8ENy/rzkkr4LC48BODXEFdifg2xHuQ
	w1PobE+1luFw7rAGtb3pvNTwRwdfwF6huGgziiQiujc2bieVmv1bxERKL8m4+WhBqQJG2sAc7Xp
	nq1RPXJgdcT4qjyStuFy2OvrDHxIVuSwQ2v2BufuABfB1WsP0ida5YHkONpwoS5CNm08Sx/BXPH
	ARpTd2uSc+3k14FI3tuqrq76i2uqeN5NVnmC64SJHC5RztGDSDN3Yu8ALbyJmINW6kY7EH1m+Nw
	6rkI22AWlWFicuoNbOuHn2o/o0tEAlvDxdPHRMMcQnWfP0dn1WgyZLkRZce5TidZgXDGppSCoBV
	07xFfPPh09ST5+XCPUL+sHRS4K
X-Received: by 2002:a05:6122:3786:b0:5bb:d233:70bd with SMTP id 71dfb90a1353d-5bddf516321mr2626078e0c.2.1782996234361;
        Thu, 02 Jul 2026 05:43:54 -0700 (PDT)
X-Received: by 2002:a05:6122:3786:b0:5bb:d233:70bd with SMTP id 71dfb90a1353d-5bddf516321mr2626061e0c.2.1782996233934;
        Thu, 02 Jul 2026 05:43:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89e1c5csm661533e87.70.2026.07.02.05.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:43:52 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:43:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH V2 1/4] arm64: dts: qcom: glymur-crd: Update VREG l2b_e0
 and l9b_e0 voltage for SD-card
Message-ID: <tigd54gf6ldtk7d4d2hr46ez6t2v4la7fcfc35d264sh5ey23o@kmsnof527zwk>
References: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
 <20260702094056.3755467-2-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702094056.3755467-2-mchunara@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfX3hm/dIvKAZ2x
 hS+kX0+3dV3v2jHncpLC25zblXs0TrnMJ1dnmpBllNkieXZLvAJQ8BsaQxO4Wt/Ty2nzikAxTH8
 fPqISq2KfzEJu3uDYXwt9aRZc6Z+R1Q=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a465d0a cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=-DgS0k4VV-ELQQNWMVoA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfX/9VDEEt0B78u
 OPjqxdWDfWcPS5KOHMEGzR3vKHfoFfXziHPRcq+hEOK8bkY/9anVNGN8Okgw5c/16M5ZXc5mwc+
 z7shYBWU/Rn7XXO+5kJaN3TiLau5hksQVtfZrQVdxlAvaefCxEBn2VTlvcVXMQomfbYuZ/NeL2u
 ZaSsFqBuD7RiYD0PBHNC4dVW7JQ+VOUKrX81V/zMZY/aM7GFRH8yJ0qFpkPJToQ39R+Omw85ZMI
 00hlokewwe2uurvIYrn9XPPujn7dK8LrHOzniymfz2gcBrH2n83ixk2Kl5x5GapIqJaYmCJBKdw
 nDPJtxO+ouztp4FPsAU0rUKzX+N4Gc5YGTHZ/IOonTihZEt7GcTotK8LhkA8gKMeJfUyFPi9FyB
 j0SYMcuQLtpCAbshBf9h+PHxkUO2sSaLFTzuisTRHvqSZAwT2P+IOtBMxds60vKsIon9wy/IaBN
 ujONuL5EUMUDszYpWog==
X-Proofpoint-ORIG-GUID: WrIwn5YHrzrcBrXpGbLBU0mvH1Drp10a
X-Proofpoint-GUID: WrIwn5YHrzrcBrXpGbLBU0mvH1Drp10a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116026-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:monish.chunara@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:sachin.rathore@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F1956F7FB6

On Thu, Jul 02, 2026 at 03:10:53PM +0530, Monish Chunara wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> SD cards may need 1.8v VDDIO also to be supported, to accommodate this
> requirement reduce the min voltage to 1.8v for `vreg_l2b_e0` which
> supplies to VDDIO pin of SD card.
> 
> NOTE - Since this SD card is the only client on this regulator, this
> change should not have any side effect on any other clients.
> moreover, SD card driver takes care to explicitly vote for the
> regulator voltage based on the SD card detection sequence.
> 
> Also for stable operation of the SD card increase VDD voltage
> supplied by `vreg_l9b_e0` to 2.96v.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

