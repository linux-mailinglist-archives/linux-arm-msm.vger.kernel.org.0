Return-Path: <linux-arm-msm+bounces-118968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gheSDmLhVWrPugAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:12:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86696751C02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:12:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=muZTeiI2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Z0b/YwiC";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118968-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118968-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08EC130831DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF593EB7F0;
	Tue, 14 Jul 2026 07:11:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E288B3EDAD5
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:11:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013104; cv=none; b=mWz18MjQ6WjPCYUBsebfhI25Ms7aRM3L4UgzRk1dXhheGITAYwbc5rLVIOgw4jYoq1Aq4wWJ7UQmhpLTGHJON25oTiQWEgD/vzAP/0f2tArhjO3+p+Layh+toM/UN52EuQe3Ly04oDOVRV10GZ/tU/92V9XET745bBHq4QqD1jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013104; c=relaxed/simple;
	bh=GZxTtPz5TUEBSGcSfR44kX4y/zG6hmSgBYYPvrBj7wg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s4LF+Yyo/oohlOC2YAJDJ6ygJRYfMGnSMYqrEA6pM1wWfe+CYr60TZQ8Q+nefDtwiTzNCISo9q+/qi5v7cWpjrCdlLJG0noB6G/K4Me3qyXykGRgnMFMOSPC0jYcOJZs9Z58l5oGTwbGKvCa/cyzXpNjf0huONCrSm/fLFrsYC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=muZTeiI2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z0b/YwiC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SU1N3929093
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ugGwcyZt6s9qQj3EvTILPzJ9fhhPURDJsFNxoqUpz/o=; b=muZTeiI2OCdnb1eh
	QIocly0MiU+FAjx3PvUvU4kZ2xGNPUHR1C/iReky1XAZsbtQkKsPPMp3tJYIGhh+
	bHUzGdOOtd53JNN16VDLG5DiFSroCihfiq4hyIk5eoVw9s/51dkbC239QQDbLY2H
	XI9pyHuKl2Poy0eUarcBKoEEy29naxpVY06h6WHgSt7rhByRWOstra4dNO+wEGli
	9gLFz8qD52ltEqKdxZjYs+M1QAV3YTT5OPv9j95cpTjEbxjFZwpOAhFeWvqRr6/J
	u5y9qrUI8NhbLt6tgSxZI2C4kZq8QHO4GXqE620bSrBHaGJjx374yrvEZGgsBG0b
	XZj1vg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd37xat0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:11:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c21be5bb4so13990481cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 00:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784013096; x=1784617896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ugGwcyZt6s9qQj3EvTILPzJ9fhhPURDJsFNxoqUpz/o=;
        b=Z0b/YwiCHHanEMCgI9V2lh5jao25v/rNXxgkJSmsPNhARj+7Swy5Vq824NqUbx6oLV
         mNcwAsWGWte4seFm6Tuh95UEjjdZ9vr6c2dr+npwnfvld4bBx6yLR8NtrlVlqVaU2uud
         cgKDlINXUnPa9sIBp92hEWD6gmVbdlUZ8AEylf8u44GEmSTYSolkVgQDzlmp6MeUOfF5
         4Y/V5VJBrudjQfOeDsPje4CXvwqA0dMnhRNyHK6gNo29OcBymg+D9lXEQJHpCLN+ldzQ
         K77BcpuD6RgtScc+BRujXA3CLoZ0crrjD0EdnIvRtch4fewBGk2T6E5UH2fvDaui4/l6
         J+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013096; x=1784617896;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugGwcyZt6s9qQj3EvTILPzJ9fhhPURDJsFNxoqUpz/o=;
        b=sEcxXJ//MrBhUUGarioGyq56vxfVKsTkITY31B7D6YlMOy0d1cIrzHnFEXV4xlthDj
         Z51AHQE3XrHVKSZpX/IZUphqq3MhmJ57lMSJenwkgOiZT+gFJdPt5KDWpvK3WtRemHFG
         xBZo2Fsx6vDC84+G+3BbDWy/y/F69dCWNTVNK9MdfYSikm40G8tqRtDYcNxrqZ/FX1ko
         u6eaDaTXXaFCsTGpBWIBzgAonHQe1GIg2BB8OVBzYPak1eCj/GH94KHv0rYQGUlt+fB2
         ksU69FjNRYaAy2IH8zBn3DN1M+Rv0NaJQGEpTf6YToe2FYEpy3znqDgBnKBTc2+WQ3Fi
         jzKw==
X-Forwarded-Encrypted: i=1; AHgh+Rqatp883+uNNYVDeQTMOgCbD9+0FI7R5OcXfDdnEVWajCB1gqy0jOS8SEeeYPe5vkCGN+AvomVnB70CMJKV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9YHNA2I7swglltOO8pQpVCvGDTkW7mdZiwjyJget7+2bxfUsN
	PBwREm1ZiAFjU2jqAwRcbcVImwbbnmbwaxMOJvrtv7kg2QAoR9GFz4TTyR5KCBrBQjhlV37Vw7l
	meiXCEO0WpXbAU8dH87XjqixF6h98CXpkneBVME9x73nAaS3bc+Hs/NOa5ovB+k/9Sd1c
X-Gm-Gg: AfdE7cnOmLTUZDIG7Bvpt2XMPHIAr3SSGd2DsvkKmYHBCokd+qpQvm5NNnq2nKadolL
	yb8GemWlomYi2TGKcDTg3SidWThyHaZqiOEbczmj4TjO+WkgBSiMGF4RRk+SADPqmwXfdL3fz3M
	8kToEG6QEwl0AkaX4eTeW5hN9UODBJEsjOpC1Fji0oMM/xs/23s5FKCbPMOl7uAwCIwruf5Z2Qy
	9VmETlxlhKLLIxFGjgoqENxJySxsDLToyhSOWr8qJGTfjiAm1JJpsVzFFTFI/DVaqklzUpiLIZz
	c1GsBgxjqhAAE7FBmCVnnMwU7c7GGHCVoIWVbqJWzpIi2sQTJyTZNaGKu8eKo7MJnpmtyktLt17
	uaRuk64P7ep9Dpy0C/Ll/TKPMsDHqjNh+MqQ=
X-Received: by 2002:a05:622a:64a:b0:51c:223:3c57 with SMTP id d75a77b69052e-51cbf3ae021mr90122481cf.10.1784013096521;
        Tue, 14 Jul 2026 00:11:36 -0700 (PDT)
X-Received: by 2002:a05:622a:64a:b0:51c:223:3c57 with SMTP id d75a77b69052e-51cbf3ae021mr90122371cf.10.1784013096074;
        Tue, 14 Jul 2026 00:11:36 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd292452bsm935204a12.14.2026.07.14.00.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 00:11:35 -0700 (PDT)
Message-ID: <f9abba69-7b0a-49f3-bd83-b38a7a451cd8@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:11:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] scsi: ufs: ufs-qcom: Enable only lane clocks in lane
 clock APIs
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>, mani@kernel.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260713173434.883386-1-nitin.rawat@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260713173434.883386-1-nitin.rawat@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3MyBTYWx0ZWRfXwQK3ypr2TmdI
 dpgy1D8u5P+cgz9Ab4wX3+OqyRHEzC1Zix+DebVV8I18ePQjid0wm/wCB+8FNaWeUa2CSIgo4oJ
 qbDJaI/9FRXIXy/1nGqr15i/IWaTnnx5lVybZYwbAEQNLhZ2c51N6nyIny5qtefdKyL4s24riEG
 CBYcx3TVLsRX6r6MnG6zDxyvCjbwSPZM9Li++caw2S6fgqtiVaSMesScBMVIO+RzVCcQgwk2tK4
 PbLPYJIUIy6e9u5G2zTrfZJPpSNzOnBZE0Y0wxYPoQWt0uM2nwdftaV2todEVgttXffdCv3adjS
 uv397h0vhN3+vm2udsLuNIb1RL/K1wkO4wteCA6mQv+Z8msuxrhSykZnyIJiY/Ort3s+lO0HltB
 t5jae3uUzMsO6GSZbGrAxv33qr856pqY7AjkcB+iAdtlxyYxjsowQmtvM9BALo99ZWDp6nN8piT
 JQV6BwZkuFHQJJoJ1hA==
X-Authority-Analysis: v=2.4 cv=BNWDalQG c=1 sm=1 tr=0 ts=6a55e129 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=uefoKjtKnMR8LWLuYnIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: ob-grjpue6AqyHlP51pCAF6OXZZB0PfF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3MyBTYWx0ZWRfX7DLtG8FD3A01
 tHJ0pk87q96lGXd07dSO364if3ejo09IVqvBtu3PV4PvNUGZFUEUZHonXcyJmBnVneU5k9Xq5Tv
 DJrGn9/lD/TR2aBAcH11t2THsDFfJo8=
X-Proofpoint-GUID: ob-grjpue6AqyHlP51pCAF6OXZZB0PfF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140073
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118968-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:nitin.rawat@oss.qualcomm.com,m:mani@kernel.org,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:linux-scsi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86696751C02

On 7/13/26 7:34 PM, Nitin Rawat wrote:
> ufs_qcom_enable_lane_clks() and ufs_qcom_disable_lane_clks() currently
> use clk_bulk_prepare_enable()/clk_bulk_disable_unprepare() on the
> entire host->clks array obtained from devm_clk_bulk_get_all(). This
> array contains all device clocks, not just lane symbol clocks.
> 
> Since the UFS core framework already manages the non-lane clocks via
> the setup_clocks callback, the bulk enable/disable in the lane clock
> APIs resulted in duplicate reference count increments on those shared
> clocks. The extra enable counts were never balanced by a corresponding
> disable from the framework's clock gating path, preventing the clock
> reference counts from reaching zero and ultimately blocking CXO
> shutdown during low-power states.
> 
> Fix this by restricting the lane clock APIs to only prepare/enable
> and disable/unprepare the three lane symbol clocks (tx_lane0_sync_clk,
> rx_lane0_sync_clk, rx_lane1_sync_clk), leaving the handling of all
> other clocks to the UFS core framewore.
> 
> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 41 ++++++++++++++++++++++++++++++++-----
>  drivers/ufs/host/ufs-qcom.h |  3 +++
>  2 files changed, 39 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 291c43448764..7ec1626704c6 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -347,7 +347,9 @@ static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
>  	if (!host->is_lane_clks_enabled)
>  		return;
> 
> -	clk_bulk_disable_unprepare(host->num_clks, host->clks);
> +	clk_disable_unprepare(host->rx_lane1_sync_clk);
> +	clk_disable_unprepare(host->rx_lane0_sync_clk);
> +	clk_disable_unprepare(host->tx_lane0_sync_clk);

I don't know if this matters (probably not since IIUC the controller
would be suspended already), but downstream disables them in the
following order:

TX_L1
TX_L0
RX_L1
RX_L0

> 
>  	host->is_lane_clks_enabled = false;
>  }
> @@ -356,18 +358,35 @@ static int ufs_qcom_enable_lane_clks(struct ufs_qcom_host *host)
>  {
>  	int err;
> 
> -	err = clk_bulk_prepare_enable(host->num_clks, host->clks);
> +	if (host->is_lane_clks_enabled)
> +		return 0;
> +
> +	err = clk_prepare_enable(host->tx_lane0_sync_clk);
>  	if (err)
> -		return err;
> +		goto out;
> 
> -	host->is_lane_clks_enabled = true;
> +	err = clk_prepare_enable(host->rx_lane0_sync_clk);
> +	if (err)
> +		goto out_disable_tx_lane0;
> +
> +	err = clk_prepare_enable(host->rx_lane1_sync_clk);
> +	if (err)
> +		goto out_disable_rx_lane0;
> 
> +	host->is_lane_clks_enabled = true;
>  	return 0;

Let's keep the \n above return

> +
> +out_disable_rx_lane0:
> +	clk_disable_unprepare(host->rx_lane0_sync_clk);
> +out_disable_tx_lane0:
> +	clk_disable_unprepare(host->tx_lane0_sync_clk);
> +out:
> +	return err;
>  }
> 
>  static int ufs_qcom_init_lane_clks(struct ufs_qcom_host *host)
>  {
> -	int err;
> +	int err, i;
>  	struct device *dev = host->hba->dev;
> 
>  	if (has_acpi_companion(dev))
> @@ -379,6 +398,18 @@ static int ufs_qcom_init_lane_clks(struct ufs_qcom_host *host)
> 
>  	host->num_clks = err;
> 
> +	for (i = 0; i < host->num_clks; i++) {
> +		if (!host->clks[i].id)
> +			continue;
> +		if (!strcmp(host->clks[i].id, "tx_lane0_sync_clk"))
> +			host->tx_lane0_sync_clk = host->clks[i].clk;
> +		else if (!strcmp(host->clks[i].id, "rx_lane0_sync_clk"))
> +			host->rx_lane0_sync_clk = host->clks[i].clk;
> +		else if (!strcmp(host->clks[i].id, "rx_lane1_sync_clk"))
> +			if (host->hba->lanes_per_direction > 1)
> +				host->rx_lane1_sync_clk = host->clks[i].clk;
> +	}

This is technically probably a little faster than calling
clk_get() again, but please do that instead

Konrad

