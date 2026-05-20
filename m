Return-Path: <linux-arm-msm+bounces-108679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PFxBx6IDWquygUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:08:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0C758B5B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9FBB3046423
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355D33D16FC;
	Wed, 20 May 2026 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ueg5n+22";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jH8LwEbF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668913D3331
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271670; cv=none; b=h3MFc3bm8JQNXxCvB+95ttqVJYbZWWuIFwaiPbjVkFL55E+WDefDdPHbdeEjJMQaeUB/C6LOOSfMXMb4a8K75cBxEsEhim70Niv+wC7OMdO71rr8MuumYN3m6rEZwtIHWzqTxGndpaFkaa7BEY2HJfytG+9o02johNVfvPg2XGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271670; c=relaxed/simple;
	bh=F1CzCtLxJoFHt8P+kMbN8ysS7uTa28Ev2UWktcjoHkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJxyXmh8OJEr4apvTla5P5id06qV5rc0QV38aDT8zLKmbne+XlvpIxYfXF7QGYxI4RQXBBFdEFljfEsniQEWnwbD1YWmaw/szxEEH1x15Ju0JZVcYm52rS6jtnt8GTA9AALMY+O8pCsw9MDfAv86S18cY6KR2ZdLBq6/Xh9vTw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ueg5n+22; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jH8LwEbF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7Z6hO629753
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nl8sC+8zm9kIr8pRpH5xNL2N
	YcseFu9h8lAGzNpYcIs=; b=Ueg5n+225sJZYlBZJLyY5ONCd9Sh4LVuHRifLyEp
	qXYILQK3xkQmrkiOGp/YrRXLtmJcNsqdBNkVxmU5yJlDm7UamWOAjFQoEU83zPO/
	KzcdPVAfVSwsLzj4wBxEkm97ArNrTepOOmL9kb+TKLspQwiDJycFOLCcP8dnOI5Q
	4p1ArxmOUhDVl01XyCYkjjzUD9BXdN9hGGBZfwAjaOA91kEZd8NyADz0BKaiJttS
	dBABC6+CMXq0J5NO786MpaR6B9wbINbvUzqE98tSpRNG0JeUNJlr+G4vwYZ3RFIZ
	WO0rp0Mzd7doOcXHxIfxGEpTISsgpFEppqbC7Cn0E4ZxOQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3nv8dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:07:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e423a05c8so135150771cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 03:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271663; x=1779876463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nl8sC+8zm9kIr8pRpH5xNL2NYcseFu9h8lAGzNpYcIs=;
        b=jH8LwEbFPL6KNBDw4wY0g7oIQFUKfA/f0ebQ/S/7PlwBDpUUKLpfVZBGtNWI0RcfPk
         hFwXsr/Y1gTN+6FO7zGz2ts7D1Xyc2GRCzgoHy5eVsxzobFrWLStu7OMED2zng14x897
         vO+hsavoMGVDZjvWaeYrYl0NYHFMD0TkxvnAJJ+VwtHmgfH3LPt5xMNZhuJCrI702GRI
         bSYzjzvH5ZMln3zK0ePKgtzvut25FNk7sCmtQX7CUgFE/WPWiHm7X/dtd6ZorY+at4dM
         xgJvtSSKpXWQMICY6MgkWESC+3absHjvrdhMPsBpzvrFhF1LNyRROr9qHBjLfqerJAHb
         45HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271663; x=1779876463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nl8sC+8zm9kIr8pRpH5xNL2NYcseFu9h8lAGzNpYcIs=;
        b=raPZ3nn1MdAMxjPcxQGa5kT+dwcFHBRmA74Ncb+ksxmlOIqI+SPyj1q6y9kNwhSRf6
         HLer8m+vDPRtUiST+VPvxVgbIp2wMn16cI3REQk2TOt/DmvCyIWbll5WOZhPKayG63VV
         fjeRIB4EzL7c/xfkhlOVNsSFBc4yg/4G0/g0MLZyAtmB24TBHTKUAa2yJq9OJ/0K1I06
         LnrBZax1y3uAY8zH3vlycSN3MbgfPAqugBrM7eAywN8oFtPUuYOOtXRGibmrhxxvRGqe
         ZgX5rBrqyO7tIE1QURD385yPkF/x/lVp8eY17FoTgDEdnxm0jBMv0IexKPjEdeXJomct
         Ut7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+GLiE7ZOdzLrgrveqhLJRvM5Loeb+SLdk3lgehB+V9kx7xDmNTVEJNUFdyvqyIc/r5SczOFl5IwqIwpGuo@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm8YscLtnTtBMM+FaZWH2+KBA2qd678XYcRJKY0XKp755zYRxd
	a92SIIHk/Z1PHYdb0AehumiWkKP4lDtRE1QslYaTxrwvLkWlaqhReQINEQzGTgvgNmyMWo/fMI4
	NzUo9pUY+v0pIy5SCgjnIYLCFPC3jwZZHUud+5/dayhwosyyu0hoYrK/Z5NumRgCunj2G
X-Gm-Gg: Acq92OGkXKLINbQimwE7T7nXs0Vqf2KxRz9BVNpUDa6Ts4hGZ6K51VfW0baB5GJBy9a
	8CcI3CggtIz39NxcW/fqf1naS+OiHl6Jikd11T1/9IMPaO8wu13wfexRDD35sh79hwyp/RP4pim
	8LMtBQ6znMbCNvLM0bpuSUyEuZVPw+osYg1ey7S1aHnZO4Xi4bimAjnQUaQpKM3wLELeuS2tSIP
	PLb+z+So6fCEaIwsAXBeZIlhRHybPaYhziWQJRCFxxMea4xcWHG82eKq2eRIfcSp7Yy2cLjkA5H
	hY4f3lrSzzq+PQVHzRTbpRxI+PeeUPP3y3gqECISBQBnQEPwcm/elBtrn1s2h3RpZrR5cElTAgH
	pQ18fyVsT3b4B5YfH2ZfTkQXEQMoSkkKIwZOkMIrYwUcNML4hmaILok5EO/oDU7/JxK488uVWfX
	debeTMmfqiAd9JAvRr9Dqf9wgxcSi+LMO07X0IU6CsIaZ4wA==
X-Received: by 2002:ac8:7e85:0:b0:516:4059:f035 with SMTP id d75a77b69052e-516418b93eamr343913721cf.29.1779271662478;
        Wed, 20 May 2026 03:07:42 -0700 (PDT)
X-Received: by 2002:ac8:7e85:0:b0:516:4059:f035 with SMTP id d75a77b69052e-516418b93eamr343913481cf.29.1779271662034;
        Wed, 20 May 2026 03:07:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c531sm4787220e87.4.2026.05.20.03.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 03:07:40 -0700 (PDT)
Date: Wed, 20 May 2026 13:07:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] usb: ucsi: ccg: Add support for CYPD6129 (CCG6)
Message-ID: <pchmvk4khwre5ib2qdjoq3wwxma55rxecuwuitfuchuu2undpl@lalm5eadakft>
References: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
 <20260520093902.2064730-4-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520093902.2064730-4-akash.kumar@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NyBTYWx0ZWRfX5itb1daqd1Zp
 dg6vwImFlrmR6zv5Qw3dWOuRZ+n9xmNW36MdKfnLXEOTCrf3vcDtgkVNHmVKHdBeXrm7OQrZLO3
 MvzlLy114hJRK57lfe2c7vjrzn3xzJ6+hZSvO/V8+aBIiZtiZ/r8jePlyCKXS6fFzXzSt0uaBRQ
 eZn5DeHH0PtcDLSM0P5Xl9UCUzfR204EQg9W89tANzR0lAgBCeFwMk45ObPPkyT1WmhSpHaI6SG
 mApL2oiPePoX95e+yvUoeUGyYwHhhWXBPv9jsWFGiAtEyw8ea+sGGaaa6pzkk6o5/IwP5wttY2U
 Was/rpvgJAOihhGcE9uwnsHP4c1a1ozQMNtLp39Y4nvFurGJ89Xbic52gRdxyGYMbT+jm47EV8P
 pFmef0KriCt5hxxXrCTaYIL4mQt3fy3mvdx/UCTx4zZaMTg83CxgEWNpm8f6LRfnhqfVYuKgBFp
 Lyy33eMns4R5N8y8j/Q==
X-Proofpoint-GUID: 3mz9U9r7rtX3esFRcYmoJ7Rh4b6gT38L
X-Proofpoint-ORIG-GUID: 3mz9U9r7rtX3esFRcYmoJ7Rh4b6gT38L
X-Authority-Analysis: v=2.4 cv=Mr9iLWae c=1 sm=1 tr=0 ts=6a0d87ef cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Hbrjtlq9a-Fw36vF3dEA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200097
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108679-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AD0C758B5B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 03:07:34PM +0530, Akash Kumar wrote:
> Add "cypress,cypd6129" to the UCSI CCG driver match table so the driver
> can bind to CCG6-based platforms using this controller.
> 
> This is required for monza SOM USB-C support.
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 199799b319c2..0695ce348135 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -1520,6 +1520,7 @@ static void ucsi_ccg_remove(struct i2c_client *client)
>  
>  static const struct of_device_id ucsi_ccg_of_match_table[] = {
>  		{ .compatible = "cypress,cypd4226", },
> +		{ .compatible = "cypress,cypd6129", },

As you are using cypress,cypd4226 as a fallback compat, driver changes
are unnecessary.

>  		{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

