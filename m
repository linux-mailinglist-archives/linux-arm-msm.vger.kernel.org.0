Return-Path: <linux-arm-msm+bounces-107372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LEsEtKUBGqrLgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:12:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BD76C535D38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:12:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 38F23300CB1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C3947277E;
	Wed, 13 May 2026 15:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBQNphDh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KneQQJHe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9800477982
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684919; cv=none; b=KUNRpYk3DHA9d6f+74aeK3RaclQ9aei1Gdg2sBuyK2a9YxfkdnDeOqbfwfrMuNOwHM6+8lrwREvKpNMsjpzL0XhiT6tRZd3VuTqf16v4llg2SpB6CvA/2aSz1mddgvq10gZwSbZxBOTaIEUR+k8sYFWAD1kfPFKARC9Us/QBiJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684919; c=relaxed/simple;
	bh=Bd3ZwhvJbwUOkyYRn5WcBOZbyngBpUARU9qYhCZjEKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSBVuyBGqg3CZhSOywCPzUaZUN6XODMN/p8eO5nOaOP1Mn09VOGTSuM33PzIRbQrfjzF3wqZIRLfXFFU5f4HLaMS90nYu7dBwr5xpyquMjNxECTxd0c+GAIvOeGTlpT7JKyKNX1Dv+rOvOkVgznD/ZOmcD+IFVCxYduw9JEzPvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBQNphDh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KneQQJHe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DF4qFM2887823
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oq4En/EEKAWtrfaB8fIsQRpJ
	JVAeT25AyzkQ5liq7ls=; b=RBQNphDhZQsABdTWlpczPTgWzVnUtmACc7/X2+vB
	xher6gIaelmzD0UC2qkU5rFyL8ndBtJbNWy1ej+b1bIgFXYGKIEi0VY5zIXxDReG
	q1seXW/QAAcsvw3rc5VAk/qF6Thmtza6N4Zq9l4XSNi9NzwPFcN1ev2vyWucQusY
	2wgcph1wy8ceu6MVB9t0wUeezybOxB6C42AzYMuUfmjCSI/Eh/DN/0I+LYxADnld
	Gh1NlqGSkZfmNfue2/H2qw9gmup9eY5awmUOMqesrrIWRl3wdlm4imNpQdiAhuq9
	cdUgarvEfEVVAGeeINOfyeFV98oPr07Cb18bV/XT1EsGdQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4ghgd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:08:38 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-63146b7289bso8712492137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 08:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778684917; x=1779289717; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oq4En/EEKAWtrfaB8fIsQRpJJVAeT25AyzkQ5liq7ls=;
        b=KneQQJHeS6z4yLh5GwbS8hkEBUtXmbOjuQGVQZO0sGiki2kF4B7czIW5crJdxOWrU2
         K/EZRiQRh0N96uIzFJPQ/2HKTWhpi94wYKji5Ff9iZCrRFD3MLkSz4qTf+bc0c3SNTA1
         4ptCSX4pDy0mn1kbow0AI+3Xv4ADuLnZRhWfAXHH2IbF+PsqxMeY+m1yJW0Fx5Ww0a7G
         6sfrP0wfQRE4Xazn5MECFAdfJbl0oT2Mbh7145Cun/z9gEPrA8FjD10PNTxPPalSYFZg
         Y8PyripWbpRrEfypTwCu8sls0FP7yq5UQR/zCyHkR4uptyNC46o4VMUbqEkKEME/NwcL
         WMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684917; x=1779289717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oq4En/EEKAWtrfaB8fIsQRpJJVAeT25AyzkQ5liq7ls=;
        b=D/61KVvKL2Lrj3Rm3mnmXPmxUYYFbUOwcUcrymYsXxtNTjmfL7YndyrjABCFYsZMsy
         61b0lUxGoNdKv+AqayrzpUecNRVkVZhFwAoRz+eejYLbVsF63CloEeStkbZLyYhd8GXQ
         rNCDWDe/9SxewOx0YOIPAHIOY+nxUb/TO0x0sm2UU8Y2kstI+RrpKVkuxBWHkQEgn53Y
         JlH28fhrJ4vRY1jHw4XemIQSQHNRlKLnFwiSXtE/i2an9X0X71ccXtTMv9Xt9I4BE/c2
         L5A/rX2S5nMmBhk+AUHb77IDfnx9xCK3MnKXCnD7p/Xjge5vRzwykz/6opfnVKziz/20
         Er3w==
X-Forwarded-Encrypted: i=1; AFNElJ/ThhewxhhgbbfR9tm2+ttxqUxkRULRRPiSbUhldgNtDeZeOgBya4c3FodjAl7KBYlXkRM/tzv1BN9QL4n3@vger.kernel.org
X-Gm-Message-State: AOJu0YyxmJCgArRZpfTj5exIXLUn+9RjEB5ZAEKL5BExw5fwZ6a7Zul8
	/PehQrdeqQ82cZ1zHdVdB1X9OhzOIKwqkjTfTMKOELfim8KLuZ5FUHsEBIbyvKHmIlNPgFhC3m1
	ACfqvxSBxTuCj+zYKFtxdFVc1sH8WC7Fafe8XPOWE/RalSb6oV465ZtEPxal/9ybLamBy
X-Gm-Gg: Acq92OEculOYPkneSY4kKIXd4RA0i5uO1fVKmRHZx78y69zlg7+qVzofGiLC4rSHU9u
	gPS/L+Q8KysQAJ67mVyhDqkziN1nn1JIdUMKzfPn1QGc6/DQJLdaIBaIjF7kJSetsPhFnR0pJxC
	4SyhNkv+5q02pN5ft0jmqdu1XOa7nsdoEwdfFXTUTzyarf9sand+vayVNJh4KwubDWLtQ1WC9Tb
	ZtncipWJBJ1Px1zFS+mG8K14ZL99wyldHMQRAtsTXqoMnYmb/oYGq6o9WUwIKK507JKWD5hpeSX
	xtJeCLdxHxPwGsXqpoSr1T23WQ+HnQOB9N/JZMxlWTpVSGnZvjf0S80h/6lAST5qd0ix6xAmFSQ
	Tl7rUu5ZNYViSwO9PDex1F296Qf9Jv+hEDzDkQiZY46d/wYa0JB7jNzrsRLdAuG5VMkdgUH2viE
	hAUWdu6ZOcI98AXyZn8wYkqtkBG8iQeO8RaqE=
X-Received: by 2002:a05:6102:509f:b0:634:2450:7998 with SMTP id ada2fe7eead31-6376164cfbemr1420089137.4.1778684912069;
        Wed, 13 May 2026 08:08:32 -0700 (PDT)
X-Received: by 2002:a05:6102:509f:b0:634:2450:7998 with SMTP id ada2fe7eead31-6376164cfbemr1420045137.4.1778684911658;
        Wed, 13 May 2026 08:08:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c66facc2sm2652914e87.22.2026.05.13.08.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:08:30 -0700 (PDT)
Date: Wed, 13 May 2026 18:08:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: Add support for Display Clock Controller
 on Shikra
Message-ID: <qg2n6pwjcoz7262eylept4mec2l74h2owfbhjykfxap6qwgzuq@oawiwgok4hhi>
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
 <20260513-shikra-dispcc-gpucc-v1-3-5fd673146ab2@oss.qualcomm.com>
 <n4wgnno2td3xmdsgwadvdtvr4ncitzio3ufufg5bp7wnga4ouw@mj76764e3uus>
 <dt5j7khzvgoj5qdrnfoi6ssye23jve5gjta5qx2ubuvufjzr2w@puacv5jgosmb>
 <1cf064d0-14b9-489f-964f-614aeed4fcbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cf064d0-14b9-489f-964f-614aeed4fcbd@oss.qualcomm.com>
X-Proofpoint-GUID: YSE8zYBxSReCXZnszmalir5BZCmhJw0r
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a0493f6 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=bIcPXSlWc8kKIrlyHW8A:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: YSE8zYBxSReCXZnszmalir5BZCmhJw0r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1NSBTYWx0ZWRfX63oS8A5Ic+SJ
 iLH3t+KshzSGf6iq/VLUP92iuqdXhmcaBdfA9CmJRzT40khGM/Fxs9022ssqORpx1ds5t+cOETi
 9oVtJKLr+dxdxubumvToTJ6QBUspRQVY5Zw0ZcckoyqCO4mt3u9VOmlsZ1bAcssrelXrTsF5N24
 Y5hi6MUsQSfvOvxSingXg4Y5e5+XUwuOKYHh3mfSgPNIINfgmGip/kqwv1wcnDldhlh7JRlcX5C
 N77fORi/H/fy0pcLjaSyrljuUhkgvOIOzkdVzG4/oeZwpLlFxBhZlnnpNe3QwRV2Hehky1XTsHL
 6W1qliPQJyUkOZ483MA+2XD4TmcxdoyULQY4QZKaJwUcLef8D+dMInxlESHDAoOLM5uq2h5mZSl
 1v2jn7/1wilfURvecN7mTyi7XDDZmyK3333kcY5uZqX5KKqhyqIDh9/KCYbrJO6NC3QR0qzekfI
 1Ksy4xi5SKBpPhpWSgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130155
X-Rspamd-Queue-Id: BD76C535D38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107372-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 04:51:03PM +0200, Konrad Dybcio wrote:
> On 5/13/26 4:06 PM, Dmitry Baryshkov wrote:
> > On Wed, May 13, 2026 at 05:01:16PM +0300, Dmitry Baryshkov wrote:
> >> On Wed, May 13, 2026 at 07:10:38PM +0530, Imran Shaik wrote:
> >>> Add a driver for the Display clock controller on Qualcomm Shikra SoC.
> >>>
> >>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> >>> ---
> >>>  drivers/clk/qcom/Kconfig         |  10 +
> >>>  drivers/clk/qcom/Makefile        |   1 +
> >>>  drivers/clk/qcom/dispcc-shikra.c | 565 +++++++++++++++++++++++++++++++++++++++
> >>>  3 files changed, 576 insertions(+)
> >>>
> >>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > After comparing the files...
> > 
> > Can we use dispcc-qcm2290.c instead? It uses clock-names instead of
> > clock-indices, but I think it should be fine to use clock-names as a
> > one-off.
> 
> Or we can convert it to use indices, since those are stable for agatti
> too - the names would remain in the binding, just unused by the driver

Either is fine for me.

-- 
With best wishes
Dmitry

