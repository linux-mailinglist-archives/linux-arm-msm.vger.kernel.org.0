Return-Path: <linux-arm-msm+bounces-118274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sRbYM8rlUGp38AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:30:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA9F73AC8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:30:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="nfXRXo/m";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=U2ilHJBS;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118274-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118274-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8D4B300E38A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A1F40BCB0;
	Fri, 10 Jul 2026 12:29:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B513F9278
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:29:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783686599; cv=none; b=FeYxGkTVi5EHn54bJGrvxSvIH5lXDPy4mKLSiTD0k/TMN4JrEcEpXumHEFFRfFbtr0RmiuLi6xpPZH7Jm7KVb/3EVyedldVmZNWCn0bWZ5f7tBUpjyIaV+pe26TzXBcNNw1hm6IGZz3pYkCxh5cDj2Dk1F6z8DZ7/g+Xd344qhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783686599; c=relaxed/simple;
	bh=3wIAzKPMdoyp8yj43soqVeH7UyxqeDxDnqA2PLVj8eA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NQGP0a4siuE5FABaf+zC8BWHRj8YRAaZLvMXAOAFuWnOwZOC1yweyYr7foK7ZWASutaM/X6jHmEdLXx992ZpdSmPZGRxay0ZOmWH8SfR3j8OiSaVTUSK/tQpvQof8uEl/SNSFXThCUaKL7801NSB+Gw+dsbrMdISzE3fab2tFqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nfXRXo/m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U2ilHJBS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAn8h7429563
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lLbBU18I1z3GJHSsjo3r+iJpKtCAH2oQJdTEa9dJr3w=; b=nfXRXo/mLW6vi3x8
	lV4pLLDzbEg0xot5NhaqIyUgyXZIa0GhbHXIPMpxjBTo+5/fJv/1s6dt/pHO9u7b
	DaKZEmX9i7FxxJfTKvTpu2jBAo6GmaZXE6TDUl+JkFSMoFiDzNqFEhs2xzfDylRO
	t3dCoKdjjmFtS3M4emjBz7UzlPviErCheumAoIz3T0rVpNeQxTyUqc5BiDE+UzdX
	QxelfaUq1n9d/Qod6I/hba9pYAkTsvFt+rfwmn7TTr+Sm519Y+UqWUkNx4DPX9h4
	vOWCOdW7K+LdfvcEs94YxMrzE5kXv8rNhcP0o2YJ9gqEbQACCSwpz+MDirg/qBQ/
	sov0jA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24v6yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:29:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfd1772d8so2040101cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783686596; x=1784291396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lLbBU18I1z3GJHSsjo3r+iJpKtCAH2oQJdTEa9dJr3w=;
        b=U2ilHJBSPCNEflwXdnbrstyOvREgrVRgx7imU5X5000gBC39F40OozQ99Dd4MoeUlg
         hWS4OIHWqxXVb1KIA2ZNhOxGunJ5Cz+zW3gr0eBGE9eLOySE5K/pg3+8+MLzjFZerN8x
         VAEbWCZuDejcA3paQ4gd3hMYeVhg5B80kybzKwwW6uNV7V/6pPKVk1eLwEtPpUpk72et
         kzjIFwWfCGNeBavydhbhDb9nvR0qpN0n8LXDJtTrzEt+VRuWB9xB964OnPRbqtKQ08OE
         m7IvizBALcKz80qz0x2BuqhHmjJXHqHKet98qPrdJO+2zkSjoLrEgexRaaF9GNkBrd8q
         vtwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783686596; x=1784291396;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lLbBU18I1z3GJHSsjo3r+iJpKtCAH2oQJdTEa9dJr3w=;
        b=DPv7/uWI64M0jwy9gLHjRgUqQXaviEW8NzCYnzvqIEFr1+wylMu57QsUUddv9lBEJH
         cq5IpZKufT3JBGGvsdiTBztotncv3IUhDnfzczOKypRlJ1hxicqEVaNkb/x/zZ0J9Oww
         E7d02RjVqa9CoFIYNieGoPyFtaX3TtpZ4uh/PDFneRViCT8MBy23S4pOVg63LjRM3EL/
         XQF3+aaiL35gsiSj19mhlpjvcV0txARdtGIg3sHvpSNota1rXiG0h81ziriyde8Edtqm
         6DsTPpCIuQOCFjeL/bbppUGtEER9esKssY7oDGZQsewT54kFVI/rEJQ/bgqUIaYIC/gC
         EM/g==
X-Forwarded-Encrypted: i=1; AHgh+RrKsvAzLD2655wDVHUYEEHQ/oYAuTo57upcfgN4V7wQZYuEmzVQ99GKgm/QA7Swy0BItsrcCoLPXEUY1Erh@vger.kernel.org
X-Gm-Message-State: AOJu0YzBdRuxiEkdRqIme8PjC50paoK02YcOHmD2+EU84Fu8O5FmSNWu
	b8To8xyGVHb/8I3T4lLyb+4/doy9f+TTw+wNxgxXDlFuJ/kKnorOy9ArkN6DwIs1KVK/RactFK7
	DTNXHnpCN6+jiV+mrVOKlj4bmganMJ4JmaYGezrvolvdGqO8en/YkceKznRQb1UMz2wyV
X-Gm-Gg: AfdE7cn2BAjjyxz6hNXmjBe/Pi6DRFgtFCY+S84EJCBhqe1lfZxIYyjE05h1Fu66jft
	wq32Y4qkRVM1K2aRihdypbCPsaH7g3HF+p0bear7efD3xcUpmd2YLAzEYrmNjAWH2yw7t+O6lJW
	sr7Q8TG/SGM5t9ZHPjljinpmURhazfttlLeHcnxaUA8vkpfUwxOCTELFdgkyOj1y2ydNbA/tHDo
	UB44aBm7hRAs5Mc1eSLDqPmVQKHOcgNvf5t9bcji3a3AMfdEjghj+Y08iLozCTGmTNiR6wGvVA/
	igIUDyktfM20Fk+f1X2eCs7bFsLsXqkhY9jl/GP1c1DNyLCM3TLP3RySLCn6LgoTo/2WFs4OfED
	+hE+7h3LEBzhqS/DxjSNOxISPOBNHPHX2DDY=
X-Received: by 2002:ac8:5f13:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51c96629826mr70336951cf.2.1783686595902;
        Fri, 10 Jul 2026 05:29:55 -0700 (PDT)
X-Received: by 2002:ac8:5f13:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51c96629826mr70336821cf.2.1783686595553;
        Fri, 10 Jul 2026 05:29:55 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd87d6sm10916055a12.6.2026.07.10.05.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 05:29:54 -0700 (PDT)
Message-ID: <cf80fc3e-2cfb-4bf0-bc20-dffecd347817@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 14:29:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-geni: Use devm_pm_runtime_enable() for PM
 management
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260710121356.4054600-1-mukesh.savaliya@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710121356.4054600-1-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VcW-u1bD1wOm9rjvscYV9emZm1CRkO1l
X-Proofpoint-ORIG-GUID: VcW-u1bD1wOm9rjvscYV9emZm1CRkO1l
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyNCBTYWx0ZWRfXyrxI7ftKClV/
 WChZi+vx+5Rn1UbecQ6s5MrV5+7w2eb5F7GgwPRLFTNsnheTfMInuCd1BFdPu5HlKRQDGo1NzvX
 /2S114GudqMvtRhqiD99ggpvfJhmdDs=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a50e5c4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VQGEhXhxWgW9jRnbskYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyNCBTYWx0ZWRfX7q09JT2UEYHL
 QDzKsn4eNZne/0jpr+GucFF2Ae0P2rceZxTMlm+dOrskRe8zLqaoG2RM2jbjrfY/Wi9EN6rNLw1
 tEk7F89ePR5k3JruMdwHTEgIgqDb9m/HaVy1awthIuhUo9dOATmKfd6JAAqNrhaQxjHUu81z32q
 uXmOyp82790C2eQrMMoQWg50ZGLpLAN/l8jb8byXDFvgmPFntJaFJeBWeB3Jn7Yn0T3Nl5Bgtfd
 ijMN8eRV0DyYTKuWDqDvUmDcyNZlfp88aINNDfbIo15Qz03fYWNtonk8AxGQoVtskRT0bqRm6kC
 wF1dB3KuYe+vuTTB8+zTSQyz2Ae3thaTffRglgn9NJa3d0ZH+OxQg5SLOqLxO0+mtvgwYaLIV/r
 G8hjG8GrkPR0wdnvxQNJlaOplWlM/kPSuAeQ7KrUwe9oJOUf7ym2cnVSbqSDGOw7Ycmc1hK8/Lb
 V2oW2HPArhY9KM/4UWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118274-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1AA9F73AC8D

On 7/10/26 2:13 PM, Mukesh Kumar Savaliya wrote:
> The current implementation manually calls pm_runtime_enable() in probe()
> and pm_runtime_disable() in remove() and error paths. This pattern is
> error-prone and requires careful cleanup in all failure paths. Using the
> devres-managed variant eliminates this complexity.
> 
> Migrate from manual pm_runtime_enable()/pm_runtime_disable() calls to
> the devres-managed devm_pm_runtime_enable() API. This simplifies the
> driver by automatically handling runtime PM cleanup when the device is
> removed or probe fails. This helps  with Simplified error handling and
> Automatic cleanup.
> 
> Changes:
> - Replace pm_runtime_enable() with devm_pm_runtime_enable() in probe()
> - Remove pm_runtime_disable() from remove() function
> - Remove pm_runtime_disable() from probe() error paths after
>   geni_i2c_init() and i2c_add_adapter()
> - Use 'dev' pointer consistently instead of 'gi2c->se.dev' for PM APIs

Drop this paragraph, describing changes like is unnecessary since
we can just infer this from the diff

> 
> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 96dbf04138be..6d6c2fa287ca 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -1126,27 +1126,25 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	gi2c->adap.dev.of_node = dev->of_node;
>  	strscpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
>  
> -	pm_runtime_set_suspended(gi2c->se.dev);
> -	pm_runtime_set_autosuspend_delay(gi2c->se.dev, I2C_AUTO_SUSPEND_DELAY);
> -	pm_runtime_use_autosuspend(gi2c->se.dev);
> -	pm_runtime_enable(gi2c->se.dev);
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;

This shifts the enabling of runpm> +
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_set_autosuspend_delay(dev, I2C_AUTO_SUSPEND_DELAY);
> +	pm_runtime_use_autosuspend(dev);


..which is wrong since:

/**
 * pm_runtime_set_suspended - Set runtime PM status to "suspended".
 * @dev: Target device.
 *
 * Set the runtime PM status of @dev to %RPM_SUSPENDED and ensure that
 * dependencies of it will be taken into account.
 *
 * It is not valid to call this function for devices with runtime PM enabled.
 */


Konrad

