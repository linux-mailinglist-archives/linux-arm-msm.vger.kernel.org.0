Return-Path: <linux-arm-msm+bounces-113674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /dFPK8LSMmqa5wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 19:00:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B48F69B8BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 19:00:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="k/hSwO2d";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="gHhMG/W7";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113674-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113674-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 929F630067A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 17:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2C034ADDA0;
	Wed, 17 Jun 2026 17:00:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48C53A641F
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 17:00:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781715647; cv=none; b=nvg7UDlMRt1Hj9bY+wuBmSlmZW3k8HYQV+cjWYcSDnGhce3IRZygT+uZFVx2KaxPlmpaPVh/3nYSgHFAoh0QwqUiRc/iLfg5kZnyZ+HXQPbubE7WG0WIdCFMLlHnvA94OumQ8qhWqSmx+XKUQvrLX2avBdtS8E/4the/R10Qi+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781715647; c=relaxed/simple;
	bh=aCyu/2R2wNUHaUekzJBrFVgx2ifniPlLE6qSjsta6JY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=axyfz+uUIphZMboVYQJYEJBts9r9taCcBB3IEzc1ATQsm6pRs2HVPGZ69kQ30kejCQhUVa0sZe3MuPTW6nr3P5OMQuFxR0CS5Jhxyaf+Zxw4SFFgk63FYZNLututSzUnDilffxNrBe+ToEbI3/XwbafC6qlBpGEapzbDFkhIxX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/hSwO2d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gHhMG/W7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HFoaws2731344
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 17:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Us2NERInGXlSBge5g4nKLlp+I4DfWzF94oT7ElTZCk8=; b=k/hSwO2dWpiQ6gRx
	KItAsa9klKu6hK6Hf0kmTDcwpNTG4jqYcMYkKCOOuRkdZm9w8asNG8ZVeB4Cf6Eq
	ewgnlE1GqCP3LNRpCF+kPv84Gv1V9lGff0dFzPJouKS9cdNsBBd15oez9S45jSd+
	uS5GlFWdZEvx6X8zEqSHf9UKm1uZwR6U3UP8pfUStYitrB7P84DAT0B9+nACZKgO
	Xak/75URRoUR6pSV3XinRl/hdCuQ9vwSvcbfL2S5fjkrWfRmAiwZLADxyJiYVDu3
	xMYR2Jy5jpIBnDNfbeV/qJXzMsx5W7EL+bHwQhWcxxLftHPtzVW0ywsfhcSzxsNq
	3ipq7g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2c8kjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 17:00:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88e0f04e51so35952a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781715643; x=1782320443; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Us2NERInGXlSBge5g4nKLlp+I4DfWzF94oT7ElTZCk8=;
        b=gHhMG/W7PNf+IZZSOoe47ku8vOICS1GgU9ckAHUrNFe75zjt/TSIph8aFAvfu7ljgi
         5cTeK1frGCDNN3IGo521uA+Cy+5XB1llx1VJi+bRPv1raLLeCMbK6IG1bqXZOeU+ObqD
         sOkXY0Vm6xZ3WyFatj96jBm0halnUbvySeXvQxu+bFaebxKegg7LpketxZZC9YkTUqCg
         nOaclY8xD9bJZozIaJpJQwL+sozuE4zcyTMtfG4vCQ0VWquGckN8+yz1LA/broN07uAj
         D4ZK5WLS1syuCyUgeJ0Qxl6+9kQCNzVO/Skbm1HIf9AQl3OuIpx41Z9z9h0SXBI4mEqu
         nMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781715643; x=1782320443;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Us2NERInGXlSBge5g4nKLlp+I4DfWzF94oT7ElTZCk8=;
        b=fnU7OEVFHaXjF+XgpOnoF21NDtkg9YVQTEryQEx9ZMjpnZVZckWOQ6PJdImbVnq+aS
         +xbB1OHe/AJGhUDbLIf3oWCQPi6j09JTa2Ejh67wwHBbUuc9OlHEvD3Ua3sBbxxnGuEi
         KIMRmkQPNLmMnaINLnm6ty6Svz/RI2BnJ+IIEW9xaxg3cKE3NcJf0b3nTTOc0k5gUCsA
         x0VW1wqNv5U58QFCFFkFhc2Ghih8cklbQCciu06eYh36NcUBcBRxSidU90bqP1TQOCUC
         B3cdrDVMKHJFmxVULgIZ+Uyjq7wi4a818KPniEsFUeTqsAhUuM7ChJtJnGa7aOkOq6Bv
         DUHg==
X-Forwarded-Encrypted: i=1; AFNElJ/CnEAiptg42h0W4jBuOv7ImdcVAA8TV+frp3bdfg1aIEx1o0mRu1vLzfiFWp4Y3sObRv/3yz70pJyJUqqK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Sm88GLMfW2Z3dTNJsrE5B/CSd68hPfO6JgJygBsrfHcex4hU
	pOGXaElQm4kMAOpeb5ApNtUb7nElB9PUslFveaq8q7x4D4FW4EapiNTZ5a/T/RrF0n0xWc50upn
	AXVUSIk8j0WgYH6EuLD3OPQEQigM9kjfZcAaqSQbtilWBVY0iMX7u51Jh5BayeqoWQkV8
X-Gm-Gg: Acq92OHeJ4St210Ss/V9GzrdoIzJ0Gn2fjVoONpRWRL7kr1/fVEh3mOdjDtPNd7zD7k
	fK4WuzjLI19MfvrTNiFN55+Zc9u/eNM3zH/FNIS73zSoZRdk1JmQLkUcN8/bOtUc6VeJQe0oEnA
	LkjY6OUBSByHNlCTzQ+FezK9fs+rhahly0TbCzR5dq1IvXaPEikT/hEiUbor0RHSKAkw352qko8
	Fno2tXKTcxrNEpdHfKb+Sx6UXMf7vnUFRXt5DAd1R/ZKvRJXxTPNOrnnpLeQJHpocYoDLsMk4dv
	DYO6zkT6q6+N977X3HkWEECCyaLIuoQtsTNiAFvxe/+l7IVggIHj3mq0D6Kk9zjfwtBHA0NXbnh
	0pd3Cuz8mrd3UOD91PweRfIjHgMtx+oiH/Abt0sncvU7IQ+g=
X-Received: by 2002:a05:6a00:4acc:b0:835:41f3:f440 with SMTP id d2e1a72fcca58-84524480c2cmr4840812b3a.14.1781715640726;
        Wed, 17 Jun 2026 10:00:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:4acc:b0:835:41f3:f440 with SMTP id d2e1a72fcca58-84524480c2cmr4840655b3a.14.1781715639106;
        Wed, 17 Jun 2026 10:00:39 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.224.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9cfebsm15151639b3a.9.2026.06.17.10.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 10:00:38 -0700 (PDT)
Message-ID: <f0336ce8-e5e0-4629-ac51-f3c42bf3d9a9@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 22:30:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 00/13] Implement PSCI reboot mode driver for PSCI
 resets
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <0c6636b0-f6c7-49dc-b335-2b4fac16b848@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0c6636b0-f6c7-49dc-b335-2b4fac16b848@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE2MiBTYWx0ZWRfXzaZTqI1aG0Oi
 VHsUGDuV8UfoSta89Etjom3L8DGDfXS3ZnOlIncPg0OnLCumZ65rW+50BXk2yzuviHCamp5dIdQ
 2lwEHEea8xuVLLSsLpwjNmf9m4V09sSNx8kl29XmK6mmUIrmOmj5CS5vQphs8S/MWscCmrJd2ca
 N8RMHHhC844gTyR/TtjeORdZ877nyr+TAeE4gtO8jabhp3FEt4GhtynPfXXwl31h0QNWUoA+4vW
 WJIRIXiA9VyGDZeQQejjD0wttvVXqpWwN2cK80FPEsF5L3UE47YsSjcJVG9ir8nzLnMfSp1R3r3
 kLWge09XuxqKom0wvnyX5bcIKUwhcACpMmphShoEKm9328qHvdNqt6hCUGAZL87y1Ro4N2ujOTA
 +MX0GAGKS8KZDgysqzeRdr/MB1KgbXzQTA5Krnz788tW+dAEfgdNRwwbybgkDFs3snY2RE65RuC
 8Agz67kVjRUxo4LAODw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE2MiBTYWx0ZWRfX7jWls/8XRnjQ
 6JspNWIpgWCIhtuOHNdbkPQeBkcO7ax1MR53FyVsQcedhpZ7DJ5H4AxffMWZ1TtwhwsSthyKfio
 GLWo/otcVZGBExzyoJ8is97Q3vK8ElY=
X-Proofpoint-GUID: qKi-nZdRpR-MdFZ6M8XiKD8BBnh5I1-S
X-Proofpoint-ORIG-GUID: qKi-nZdRpR-MdFZ6M8XiKD8BBnh5I1-S
X-Authority-Analysis: v=2.4 cv=WN1PmHsR c=1 sm=1 tr=0 ts=6a32d2bb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=44Clojva6rUT6T7xBPZ1Pw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=yyym-DC1bhT9zQtRc4EA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170162
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	TAGGED_FROM(0.00)[bounces-113674-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lpieralisi@kernel.org,m:arnd@arndb.de,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:florian.fainelli@broadcom.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:andre.draszik@linaro.org,m:gregkh@linuxfoundation.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:srini@kernel.org,m:sebastian.reichel@collabora.com,m:bartosz.golaszewski@oss.qualcomm.com,m:quic_songxue@quicinc.com,m:sre@kernel.org,m:mark.rutland@arm.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:ulfh@kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Souvik.Chakravarty@arm.com,m:andy.yan@rock-chips.com,m:matthias.bgg@gmail.com,m:john.stultz@linaro.org,m:moritz.fischer@ettus.com,m:brgl@kernel.org,m:sudeep.holla@kernel.org,m:con
 or@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,collabora.com,quicinc.com,arm.com,rock-chips.com,gmail.com,ettus.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B48F69B8BA



On 29-05-2026 19:00, Shivendra Pratap wrote:
> 
> 
> On 14-05-2026 19:55, Shivendra Pratap wrote:
>> Userspace should be able to initiate device reboots using the various
>> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
>> patch series introduces psci-reboot-mode driver that will induce
>> command-based resets to psci driver for executing the device reset.
>>
>> The PSCI system reset calls takes two arguments: reset_type and cookie.
>> It defines predefined reset types, such as warm and cold reset, and
>> vendor-specific reset types which are SoC vendor specific. To support
>> these requirements, the reboot-mode framework is enhanced in two key
>> ways:
> 
> Hi Lorenzo,
> 
> Can you please review the if its aligning towards the suggestion in v20?
> 

Hi Lorenzo,

Was planning to address the mfd, and other comments, for re-post. Any 
feedbacks, that we should take care in next post?

thanks,
Shivendra

