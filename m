Return-Path: <linux-arm-msm+bounces-92299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JqEGsveiWkaDAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:19:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D6010F909
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:19:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D7EA3015A68
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 13:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1754367F5C;
	Mon,  9 Feb 2026 13:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXhi+Rhn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CFKJQYSy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B092040B6
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 13:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770643142; cv=none; b=pUZDMhRm7T9tb4A6AjImRSvMoZPnPvvtprkjzgvj7Zzjor1eKCFcTTL/lUjzRyJkSUYlvwIDX7vRdvhMfJJIeU3ke09rL/nEbVNc16YcUsj98JAoIACgAfGxj7qq/7dIf1YA0qrO3M3HHxZR5g0odHxRof4zbTgk3LrRVj8gx3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770643142; c=relaxed/simple;
	bh=QtbFyDwByno/+Fcvo67pvRhMkIefcJYdwSnR+hJpQWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NL0pZMZpUWGU+K1bM/0FSR9gtPT5yjFr75TCofIfHnY0QsdUStvkmYvcqu/1JlwhDIYbTOyHuFgiqyBm0+daPqIF2ex273ix/wXbZAN1Lk28Strxw+s9DfW5zLt5ZnjZ9QoxORHuR4SjDmDg7M3iXMwoZm2YLP/mYxnrDW97hbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXhi+Rhn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CFKJQYSy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619BCEFR2586954
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 13:19:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4OFU6emgi2Br2ZMoR1rOPKjB
	D5ztXikTIpwBIs6JuFU=; b=XXhi+RhnXCLsr1GyuNsoPvgagB6kPYiZoHPSQC5h
	fI2Kf4ToR2fbl5k30SeRdhyIEwzxEmsLodhrDl4BfSeWqr094U2XhfgIlAZbnr8K
	+qudGVulUL7Uf9pQXmL2RJgxeDL3oVyrqSZd1/gVqoKFcfSzEL7a50C1qzkYAj8k
	2Dyj2PQ+sQRtsfFjEerBLKYmhzYVkB/bxUFrotv9smQqdV8XuRlkYhyM7+kF9635
	2lAoPwr2PmL3TeLA6MGjib+0HdQfkLEPaJyfRXb4K7ZzxDkgl6pXiXp7CaOcXRf3
	RIlFR+w/jim+rdJnf4lspX+5EVOLiCKnFsPpuqDNm3Dx9g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c793bhkbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 13:19:01 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5f53b7f1341so2103225137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 05:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770643141; x=1771247941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4OFU6emgi2Br2ZMoR1rOPKjBD5ztXikTIpwBIs6JuFU=;
        b=CFKJQYSyY3LRUdgZxBIoEi96/K8+5lN0Ott5yGVZ10qRE5U1OfRiup2rY8a6WNS2Tp
         8IqqPoN9pTWASywjddIy/Y/bCyeNfP/Da8guiwiHgC2Vm39LJNoeMOUKSXJ99lo6biQq
         jpRmSa2HCEZj8m0RbgD2RWXNZ+llViP3MDWQgHMNPyl1f2xdp6NbQr5fDYket06gPFCY
         tuC0FfxaJfRO8YkRUem9KUPLL5BRMGFk9OKPeu78KZYx/rFu3FzYrQLYnEG/hntVJEoO
         ec2mhIVdiE0vHETC1lAnTM/PRFnHn3oOqLbbv6cFiQCzSf0gqO2s5PD0Cx8mHw0G/hMn
         UfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770643141; x=1771247941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4OFU6emgi2Br2ZMoR1rOPKjBD5ztXikTIpwBIs6JuFU=;
        b=CZzOZvri53zRWciEVmKDeUHnvYJEje1UvX73ZMEvyBpBSkdoEenkm8qjtkFX9RLrKC
         sPMvQXevsBZfa96YcBnCX6Q3L1UnMTpoz+v3MlauxAnbNNLiOM8Y694+675l9IuzGUYp
         AXDDYK1wG0hRcwjQoVCCkyd6En5YVA6WuSvfqgWiXu+46Qfm8LnX9TXEDtaUQqPoPSBX
         2JBQt+QpDfzSha+T/mTq/wH6XHR5lXAD94y/aIE6NYeKBeTobuY0lBTUz1+6PWh2EoJe
         vJ3IhXICsALKHoBrqC9ohZMPcoItPL3YDzPlGUkhGr8jMImTMYh3mj1FkOV83az4K1xl
         duNw==
X-Forwarded-Encrypted: i=1; AJvYcCWPWejUAZVcuvTW55V7dykYOFFQeqO2O8mAPQezuTTE3nNXNn0so+akzqJY1UAbQAnwLP7EH3z4Pw/QKpWl@vger.kernel.org
X-Gm-Message-State: AOJu0YwaReQIYdN1uFsYxj4mA3BQpWjFtNYWMnvsvFwaLymIUHfhsoY7
	09823UsOXqZMNwzM+Gt4NN4XDdZE0alrmAprTveigcKbrywzjVTg0hk7rOV7eaW3nkEtraU4xdm
	laEYKsjPXrnoVD01Bh2yFCw+GKwq9sWs9l4aX8JtpVitl2XeNTuDALjhFfDpjT+P6EPS5
X-Gm-Gg: AZuq6aIIFFKgB5zhEkEDBD+xAw6hfyxhJy78hlAQ7szLFGBS5GzFXTtg3b6PsSGOVbG
	PSFz2DbM64mQslvuwDmpp3gS+u35z7p34eYbbENCVoIUUOLvRb+Yo9jefiU9YohU0PO2ASdb78r
	Fsl4lmhqUZHGFTewjY2Psir/KdKSS1qrDxHiMlcwEiMx/iGKL0QhBz4CTXckpdgzDH1ZJyH002C
	NNWuU2W/KUDLjyUS61fVl0y3Uz4GT6/kcvmFPsEz3VvDU0FE5dqZ8W198Uv56csO/z6ivDRxn+5
	sICJUyi6m4xnUp/0Lr9XcIsegdHztFtgCUDExnAhuVrtEm8j5vaIUkbBsP4Zt7PtmWzULQNxZfl
	Lv1wHNyutWUpy63gseTckySJy9FOXrFUuXJkC7hR7Fewp100s4N1NLFmhVv1j8mhfhQ9/NE0DS2
	JyGX5PtNCa5OWkBDbEK89Mpt4=
X-Received: by 2002:a05:6102:3a12:b0:5f0:2451:5f5 with SMTP id ada2fe7eead31-5fae8a16753mr2624750137.7.1770643140947;
        Mon, 09 Feb 2026 05:19:00 -0800 (PST)
X-Received: by 2002:a05:6102:3a12:b0:5f0:2451:5f5 with SMTP id ada2fe7eead31-5fae8a16753mr2624733137.7.1770643140502;
        Mon, 09 Feb 2026 05:19:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6feasm2652133e87.7.2026.02.09.05.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 05:18:59 -0800 (PST)
Date: Mon, 9 Feb 2026 15:18:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/5] phy: qcom: qmp-usb-legacy: Prevent unnecessary PM
 runtime suspend at boot
Message-ID: <hm2tashsvxvdkfipk5bojwoo2cfk4ifvodgwphgrdxz6g6iq3u@62ub34jnxbz3>
References: <20260205160240.748371-1-loic.poulain@oss.qualcomm.com>
 <20260205160240.748371-5-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205160240.748371-5-loic.poulain@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ctOWUl4i c=1 sm=1 tr=0 ts=6989dec5 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=b7NUgUE6t-UYR0nikDAA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: 7VuAqj8S-CL0NSNbEhXqQeBblrMLUCFl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDExMSBTYWx0ZWRfX8Kmz/bqtRwFS
 yCL3dVvgylFMeD/YdmwtdS+3XmQgpK21HachboVTgwwPbD4UppD/KI/xH/M7hYLaXqvIJ/4TCub
 iUcXAXRNStIoMeC9MKGNDbMJz1CnQ8yGM2ChcXtFANjUBjQGSpMJFrGFIhK7sqj8ZRKckbnkdgM
 9DSTb9/PKaUPtf/L5CSLuRK9wxkDzXA5mz/Qc6juINcLmhU5HOiFew5px5NsraZPNJPmmeoGn/r
 anKhuEEPXCtLJvw/fzDdWK2HQPEcLisiAR3AUaXYC9zY5lHCce0hnrfvSseXxSXE3P0/fUfu5hf
 ezSsWbcMrHSOTBRX6aG6tknigfN+jBq5JgzpErhXxG4UxKor7xrRWQukCLSHNKny0IFXMRCxJYd
 wFDg0ZqTZFke7902jsKdtaKlxhfhvw8iaxsBzjKLxPC2s5zxQBZTmHujI1n/y/r539vehGETR2C
 6fbhwn+gdc+sNYRqbWw==
X-Proofpoint-GUID: 7VuAqj8S-CL0NSNbEhXqQeBblrMLUCFl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090111
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92299-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E6D6010F909
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 05:02:39PM +0100, Loic Poulain wrote:
> There is a small window where the device can suspend after
> pm_runtime_enable() and before pm_runtime_forbid(), causing an
> unnecessary suspend/resume cycle while the PHY is not yet registered.
> 
> Move pm_runtime_forbid() before pm_runtime_enable() to eliminate
> this race.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

