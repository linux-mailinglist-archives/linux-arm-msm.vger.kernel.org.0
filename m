Return-Path: <linux-arm-msm+bounces-90384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iD1dGW/Lc2nsygAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 20:26:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDD97A240
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 20:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45573301570C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 19:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7D2284898;
	Fri, 23 Jan 2026 19:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DTAtQ9Qh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K1p4nl82"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A100260592
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 19:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769196394; cv=none; b=FkRAozHKHmAFXp+pi8o/jMVKYN7EV6JJhDzF4tsSXUhi4lSWd51jmxefj+stV6rxn5rIS+sQhqYHpKipdWBhRhwOpFkGQhx1cz2BccX0Xzbj0XpbZUOY1MTPNFkeLv/ja6j3qFJ43Ta1fQGYrSW0jfkE/K4EQCEsXvcADl9yelI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769196394; c=relaxed/simple;
	bh=wXE7Z9OCOw7weTySTvgeTgXcpN/s9+IKG4Ms2kxtKgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NST0s1Q5q1dJnDi4Dk8G4eHUapb0zm4dT1x+Roxob92EGyZMh3dLCPnOuJZRHpMio2IkMsJTgsgGmmpmNiBooqrKR63jqDtlab3ggmWpR81MdU8CiFn6Pahwfkq1yHGM/I6OcSQThzZKqAo+xJ5uX/wymExNI6372QbwfW2ZNyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DTAtQ9Qh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K1p4nl82; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NGm6lO3648936
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 19:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e8hAKZySqTcQnkl20vjocL4c
	PvHjCgdXva8j6wqimVs=; b=DTAtQ9Qh3K3QMM2wjQuH63PLe83q+2UMFztd8i48
	qDT0On5W9qYeQAigOs5Jo3kAwXCWZwLQ1fZSRcwdCJZam5OhvunXEiPpH323gZzp
	SfqkYvTiYU+ezt72vmKoffEjEEz9yq9KUcQ24FHI1T7CdRNvuzz7T9WGQ94XiVPB
	jRcT+0j+WWSCC6Ld/q4OypCteux/ELBB5O9GLxFMvPAbIxWN63wTHIEa97A/uib0
	dGFpSX7i6YoYUcWIF7CLQUMR2kKh4YvtN1Fa2jXxBiX9UQPFGzHabM+DCX12MQHi
	mcbS07lqni+rw8bsTFziU5n093tVZcfwp7Q2/3pHqTdV4g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buy4nuhvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 19:26:32 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ecdded59aaso5255555137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769196392; x=1769801192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e8hAKZySqTcQnkl20vjocL4cPvHjCgdXva8j6wqimVs=;
        b=K1p4nl826Esa3TUIGkdnO8E3qclCniCdQXdQVZi6NzeGJ5o44MwsN5fs1R3gSpe1yd
         OSK4f+Xggbw94I3UOvb37I1UEaZ/Wby/jyp2GOiK2o/jU2wiLxcb+rkqz0JZpAetrL89
         NTUxTv8C6cxtLLJnGsG+fVDnfIqoFp4/feV6shcesr4en41AakOUYR9cIo6o4rokZ47a
         gv1umZcK5AC47AL3iXpx6TmuJgDTmDvVMLePLwbbS8F9toMje8bApOSjE4E1TyqjJB4r
         Pg1E99OSEqfGO2faw+PSnp4jFxKrmKFtdQLGp8ZVYW6UjFKwykvsRq/4OYJ8cCMrHVln
         WY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769196392; x=1769801192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8hAKZySqTcQnkl20vjocL4cPvHjCgdXva8j6wqimVs=;
        b=AekKarak8r2CYQw+5cKLt+HINTuJCYcBeLoo85tYzpI1CpqobZvA7WX6kOcV0fUhBL
         u2TEpQEn3nu5P4/pUH1t0wdkno+kVcqkynYAAiMsD/NluJ9cMQPJwI6i63HEltfRXTkF
         cpCxfTTYECT+cl7br1BLbnOFvaQB9mKKCADMXRV9EDU2Mm5BfcJFQidGwe1gJpAhweSe
         n5TF94SfNGavcyfpuw/6pebuv2M9Nopo+uqLgAGGDFhXr0QUbGHa1deLAtyEfKP4avfF
         I0HTXoK4RRB2pDJ698zkqTG/wWw9f9JFyaoklS3kYh3s/5f0S8Samije1YhjRuSXaYwW
         ED2w==
X-Forwarded-Encrypted: i=1; AJvYcCWh2vqdX+pW90lK8vIcRz0whQ1Ss8W9E2zdxh0fEtAXDLRRjIgcbwsF0h2H0o+axaGKYxQNI/GGpBhY/fFA@vger.kernel.org
X-Gm-Message-State: AOJu0YwUVW/ue0RiEkTpRxTzdz4k5sOrpvudWtA7dZPoy8vnPw9CBvBY
	vuDey2jzz0gxZGZbZua9NzZdulBRKK1Ioj03MhTfwsLXGXVl6y5VvUpUrOZszWjBFgHj8bN8a8o
	QSQlYfZxhTnB6gHjFHwU2gvt11pZ39y4MZOzbNyFnPCG+WV32Ny3nezeoAlrjXq9+kUy3
X-Gm-Gg: AZuq6aLCggl8HYmCCWUb0t+y/f2voNvx5cCf7ltemPjsYEnVbBKLSvxt8loIi6CzxSH
	oFas3EeXI86f79cp3BBgpZ8IMz+u+ZZdEFnOBelb9fkaThrGb6NXyV1/4/nlXniT4XIaGBCo1mI
	MkIYeM/gq3Ms0gCmEnsTRvlxInAXmR1wE6AKWgydwhBL+1LbDw3jTWDroBHNLXn9R6bfXk3oINI
	Z1XGsjwivoaC+9eAS7Ylmw3E37drXQIO+UvxkADmu1MdluU8nxlpNDJy2yMRZyJhxgYkN7JL2zI
	Urx4uTv83NuhcQoypIveO2NBP0ryTj2LTCJjgTnZrD4cnTRerhkm/fBp0jtvilnYiDGTTDb8YRK
	3K4ogKy1LllGcM0oP+gnU68Ctb0ttwbEp1B3ZgqRdI5OZZD/Anbwdv5IXcQcKO1gw933TSNMEkL
	EBs65cR7FCoo8Hv8GyrShTA0M=
X-Received: by 2002:a05:6102:3046:b0:5ef:a3b1:3012 with SMTP id ada2fe7eead31-5f54bc6454cmr1355855137.24.1769196391743;
        Fri, 23 Jan 2026 11:26:31 -0800 (PST)
X-Received: by 2002:a05:6102:3046:b0:5ef:a3b1:3012 with SMTP id ada2fe7eead31-5f54bc6454cmr1355835137.24.1769196391265;
        Fri, 23 Jan 2026 11:26:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de492782asm848942e87.88.2026.01.23.11.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 11:26:29 -0800 (PST)
Date: Fri, 23 Jan 2026 21:26:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, shuai.zhang@oss.qualcomm.com,
        cheng.jiang@oss.qualcomm.com, chezhou@qti.qualcomm.com,
        wei.deng@oss.qualcomm.com, yiboz@qti.qualcomm.com
Subject: Re: [PATCH v1 1/2] Bluetooth: hci_qca: Refactor HFP hardware offload
 capability handling
Message-ID: <mt4j2cxliqkwbeprt7ye2kt2cgi2bjfnz2knfgxvy7fy6wda3p@jadb7x7ocagi>
References: <20260123055243.2634107-1-mengshi.wu@oss.qualcomm.com>
 <20260123055243.2634107-2-mengshi.wu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123055243.2634107-2-mengshi.wu@oss.qualcomm.com>
X-Proofpoint-GUID: A2T9cI_rKtgIiu_NTLVw7RaUW-iDieZY
X-Authority-Analysis: v=2.4 cv=I5lohdgg c=1 sm=1 tr=0 ts=6973cb68 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VGE6h4fSrwVDp8RXrTgA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: A2T9cI_rKtgIiu_NTLVw7RaUW-iDieZY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDE0OSBTYWx0ZWRfX1uUUP8ShfMV+
 /MQkUgA5Y0b5NJ5sjeeDF/4Lypr2ZmNDQzE1bCsLOdmJ5BC3r1fSibVfC2odcFLZBeVeglxZh4b
 0qzDoCtKl12YawIzgkQFZn6mi2eja5cPAU1Z8llvUGSN+GKWpTu/9H/TVQl+oUkmg9r925gudLc
 ikRZOYikUPKEAeg3scNJWCBg53SSzvTjElSVJHm0KPhblum1IURADpkyLB5+0pBoDjV5lCoKIo/
 6JZZuTsARajIofBYl7wD6mqv+pOEKvjtuIc+Fd1ZkhM5rz5f7kPX4xXb/ippy7+06GJoo2Xaf8c
 D6TPYzqvo02syLwrIn5djDUx9L7F1HvZ04R5DJwydZP4kxWVORXd2nMpY+hzURQ24jy/YHSTtF6
 GwUBXwZXZ5krQln8Y6H8ifzbWIIzRuewy4ekjRyVgm2cHKja8J7IdD+CByRUFNNaf4dddsQZFtm
 c2dX2A174n+7empz0+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230149
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90384-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.986];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BEDD97A240
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 01:52:42PM +0800, Mengshi Wu wrote:
> Replace SoC-specific check with capability-based approach for HFP
> hardware offload configuration. Add QCA_CAP_HFP_HW_OFFLOAD capability
> flag and support_hfp_hw_offload field to qca_serdev structure.
> 
> Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
> ---
>  drivers/bluetooth/hci_qca.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> @@ -2033,7 +2034,7 @@ static int qca_setup(struct hci_uart *hu)
>  	else
>  		hu->hdev->set_bdaddr = qca_set_bdaddr;
>  
> -	if (soc_type == QCA_QCA2066)
> +	if (qcadev->support_hfp_hw_offload)

At this point QCA2066 becomes broken until the next commit. This is not
a proper way to do things. At the very least, squash the first chunk of
your next commit into this patch.

>  		qca_configure_hfp_offload(hdev);
>  
>  	qca->fw_version = le16_to_cpu(ver.patch_ver);
> @@ -2502,6 +2503,9 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  
>  		if (!(data->capabilities & QCA_CAP_VALID_LE_STATES))
>  			hci_set_quirk(hdev, HCI_QUIRK_BROKEN_LE_STATES);
> +
> +		if (data->capabilities & QCA_CAP_HFP_HW_OFFLOAD)
> +			qcadev->support_hfp_hw_offload = true;
>  	}
>  
>  	return 0;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

