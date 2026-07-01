Return-Path: <linux-arm-msm+bounces-115735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s+jLIvIxRWoE8goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 17:27:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8B56EF3CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 17:27:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HQCscZHD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jih80lnx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115735-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115735-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2923E3047067
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 15:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5207948BD32;
	Wed,  1 Jul 2026 15:17:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C5E48B382
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 15:17:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782919064; cv=none; b=mfaXut7sAi145aobkAiPBEVWtWbxRUf1mwsa0e7bd8VwKV7y6j6hae+p4BUSYM2VAbiJLxTgBz5159uN3RrqqYO2VcEQam6LsWrFLhTADshh1UUI+1QpQ74VplUN9eh8Pqa6ZOSi5dOMIzPevPqc/Rtj/81bsEf0Vu/Zbt9ZsPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782919064; c=relaxed/simple;
	bh=by58mvU1Sfixgvz9hF5W5LYNik9UGMcTUhzX33TMKjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iAMx+fpRqPB3NIujwYebwkKTi/Rs5vwZlgXoHasGJyz2VpyAgPvcGInh7nj9y0hVsQs6VSjlk11MRdYbQzjXC4l7zNR8fyo79admPVq/JnUJ4IGldgsM+m2CvUlHvpbcKbM6ixtEnXags5RTLf5f7R7sdwrHReLTYKYzS9TxLvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQCscZHD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jih80lnx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8frl681650
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 15:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eL8RzYtzz14uHHHZjdkg5Lcy+jo9dJN907wPOrw5Phw=; b=HQCscZHDsrpvDfg3
	G0oD3d+Ry7j7w8ED7pDiRilXkTsnDxmcTuW1qRZDjPvFq4cQC7zKwehaXFAELj4D
	uHylXxH4GSes/yvWOKkQDiXVkT1Fo00dDiXjd5+RY/T5JSzCdBPXgWqlh6pkpxw2
	RmCYoS6EmNPNShJtFtYh43JoJMOIZJ3l+19oh4AwBl0H3LthATxUfcl6dRLET5L3
	p8SxIF2VUfDEl1S+tkPv6RTHUW68VsptxNyCH2JmokTcP6rBDxF5DmkxW6AlUdFS
	+xY3/BJeW7HGhoF2KmU+Nr9H0gPrfKlHA4fLigvyMcUU9vtKfOhp6pd7mnUdh2j6
	rtZDnA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3smuk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 15:17:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8478e9c4bd2so778876b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 08:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782919060; x=1783523860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eL8RzYtzz14uHHHZjdkg5Lcy+jo9dJN907wPOrw5Phw=;
        b=jih80lnxrWcN/PP9UhybPri5lcKhhYYrpnnxi83mlc2x9lx/OquG5h3jTMwyKBTOmp
         iOxaSj01FPr6GdXzirGGmfMPTCErSU0XYZZPYdeJSOVvrt6s8JB1yM4umBzhbmmmBmIt
         ekb/OchbaBCz8YlPMU5WPOsCaWwlloWJgnOI9Ekvpfybx5Zluu498MrOWsP9Is1ChAPX
         zM2uHdDNgqu9d2qX7AvbLd7O4mdWNtYWD7hq0d5tCuRwdt81BQNerldxy8IYX2ZHMpe0
         Bxd4poUd2iKeGvDH1PSUaTIb0hnZO+qHQ0ufEXAPJfeGoY/0WDCgF8J4tOIPOPg8ggSn
         Tz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782919060; x=1783523860;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eL8RzYtzz14uHHHZjdkg5Lcy+jo9dJN907wPOrw5Phw=;
        b=PcUZOxdc0NtMIkhzzR6McMu6JEoHeYxGn8WMhAgmpow7shygYPcpAHm1xYRBc7Emaa
         Fytwh7YOEjR7w+6taCpIIBYlIqoTCbOjLbEfhGYqSJIMaGFX1hWC0G/Pg+e7Oa9TQQUP
         ZnWsUQc29xfZpUrJVTYf8+cVwZHLu+UWxUqf9MY5rydtFk0uoPt4T3ZqzkdWDLmQgvQW
         KsUww8rrAnjHlQvNx1NsyVgImzmNhX4p234EHS+HH+jEE3JiR6jEfLnPtg30TN8ikUdj
         2o1SG9nJylx5sO6ZCFveu4kar3uNKVGOiq/gxTB/UHumgv4rDCBBnuxqVJe4SHzzvS61
         1Dsw==
X-Forwarded-Encrypted: i=1; AHgh+RoZ1RjwuTdoODUTXVSSTT3P1q9Hqz62dInWIfbTN/+a5jyx57qoTv1BlEoxUNtD2Dtq7Bldoln2hdcwzB0Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwVgwh3NuORke3BCMzc7No8alP0gch2r5wNwLAZ9w2oIGSsbyy/
	GeZlkan7qYrQRaju4pb2Xntkl3IPe3K78YMiWC6iwRCiFzU6RPI9EBosGhHZqoFtLRjV1Y2eHMj
	1pYHaYGvGTEgfU1YdFzYPcsNscaJltLr9yxHBxzXmaB0zFmI6tTBPmtvGS1HVQQnv2QbG
X-Gm-Gg: AfdE7cndBeVz6vYmBM/fXh8VZjj8a8wwHGyBrtgQ3b9LpGF1kN8pwIGUFSIt9khTyCE
	qIrpJOo6f6oRDAkriynnnvRctveqrvrzY8k9XQWvMTalR5i39niVVUE8Qouxc28V01TV7dsJ0gr
	ardr1cuM8l39t2q66O5J4HgIPgaKlbXEbB9bmL4URgCOFjw2SEqdy5Rf915HySRY8+BSW+0vm/7
	dakaHHuCzLsFEltwOFcum14Y80MDAIoya6+2MWWa5R8sWKBRe/nha+NqIhsinWcHduCJTBVION9
	w/LCvUf/x7SAnNyNS87qUGOhMe/A57pXI2Sq65AaDu6OZtNqQtSt5K3QvjwyvY5t07Bm6ZUX0TP
	08vn3kqfvr+Y1M6KZVacDY+dlc/DTIe6vehl8JXPwE1Cxvg==
X-Received: by 2002:a05:6a00:4f95:b0:847:7128:ecf6 with SMTP id d2e1a72fcca58-847c512d7b4mr991676b3a.40.1782919059350;
        Wed, 01 Jul 2026 08:17:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f95:b0:847:7128:ecf6 with SMTP id d2e1a72fcca58-847c512d7b4mr991654b3a.40.1782919058882;
        Wed, 01 Jul 2026 08:17:38 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.232.144])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a039f2afsm4262001b3a.53.2026.07.01.08.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 08:17:38 -0700 (PDT)
Message-ID: <73243e36-175c-4fe3-a448-b30eef9c44ee@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 20:47:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] serial: qcom-geni: add force suspend/resume to system
 sleep callbacks
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20260701-add_force_suspend_resume_to_system_sleep_callbacks-v1-1-38c9a721a462@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260701-add_force_suspend_resume_to_system_sleep_callbacks-v1-1-38c9a721a462@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BpYZjHRbSO9RI13wTxfSZ4CTqW9emy55
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE2MSBTYWx0ZWRfXzT0HwFg0k0Hu
 DOMqrO3vIokfYXQGng5V620E0W4nKrTOnXxGI8gbfcH6rhWtQJdrfVkQCYSV9V70+Vm+9QDb+NY
 G1ZIe6scTmfRzn6h18ILfHOplrhNX0M2KQn+5NR0HoRlf3/wVMK7mdSXkesYKqvpxWHoidfcYc6
 gr/Jg8QyqHCc4KDFjYmol2lcUWhqBVITYzVp5LMfnxxS9jpMoUoqBxACbFN0en5qAfLODk4pgZR
 zfLd7ug/L2lb2RAlmmy8KlpC+pxCQxDaUTiIs/tUbGoJ+/CPvDEtPMCVE0UC9O9g0Fz/KOuq/QS
 531XhOdnaXAj2XuPXuPTIKUEjPMuDUIlGKW558o9TUVthAldY8uvbx6MIcagbyPFCd5P5WKGXnv
 9+ATnklvEuY5lfyaARkqDUGBMHpedmi1b62QhyeOVEZcOSO1uR3rS1la2+E2FGkG9q8Vs/gl8ti
 UksJm7E6qzMAs7Oh8nw==
X-Proofpoint-ORIG-GUID: BpYZjHRbSO9RI13wTxfSZ4CTqW9emy55
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a452f94 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=1q2F+KrbvUZPNaeG7DbW0w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=WaUktqV4Tl373BT39uoA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE2MSBTYWx0ZWRfXw7QrLqWFdsKC
 0fD/Ow2DEt+TiUiKzN57t0PPv813VGBKPS+Y3xSmVpa9koWaxyA4p+jCkGfl5uiGAA4KBzd7T6k
 0WsaRidm5E3rbViOpoLUNKXONU6hyX8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010161
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115735-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF8B56EF3CB



On 7/1/2026 11:27 AM, Praveen Talari wrote:
> During system sleep the hardware resources (clocks, interconnect) are
> not gated because the runtime-suspend callback is never invoked from
> the system sleep path.  This prevents the platform from reaching its
> lowest idle state.
> 
> The system sleep callbacks qcom_geni_serial_suspend() and
> qcom_geni_serial_resume() rely solely on uart_suspend_port() /
> uart_resume_port() to manage power.  uart_suspend_port() drives the
> UART PM state machine to UART_PM_STATE_OFF, which in turn calls
> pm_runtime_put_sync() and eventually the runtime-suspend callback.
> However, if the runtime-PM usage count is still elevated at the time
> of system sleep (e.g. the port is held active by an open file
> descriptor), the runtime-suspend callback is never invoked and the
> hardware resources (clocks, interconnect) remain enabled across
> suspend, preventing the platform from reaching its lowest idle state.
> 
> Fix this by calling pm_runtime_force_suspend() at the end of
> qcom_geni_serial_suspend() so that the runtime-suspend callback is
> always executed regardless of the usage count, and by calling
> pm_runtime_force_resume() at the start of qcom_geni_serial_resume()
> to restore those resources before uart_resume_port() re-opens the
> port.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
[...]
> @@ -1963,7 +1964,19 @@ static int qcom_geni_serial_suspend(struct device *dev)
>   		geni_icc_set_tag(&port->se, QCOM_ICC_TAG_ACTIVE_ONLY);
>   		geni_icc_set_bw(&port->se);
>   	}
> -	return uart_suspend_port(private_data->drv, uport);
> +
> +	ret = uart_suspend_port(private_data->drv, uport);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * When no_console_suspend is set the console must remain active
> +	 * across system sleep, so skip the force suspend path.
> +	 */
> +	if (uart_console(uport) && !uport->suspended)
> +		return 0;
Rather use console_suspend_enabled and take action to go force suspend.
Here, it sounds opposite, if port is resumed, you don't go to suspend 
within suspend function.
> +
> +	return pm_runtime_force_suspend(dev);
Is this really required ? if  uart_suspend_port() successful, what will 
happen with this ?

>   }
>   
[...]



