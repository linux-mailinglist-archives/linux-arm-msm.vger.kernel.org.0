Return-Path: <linux-arm-msm+bounces-95612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oI2FEDFqqWlN6wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 12:34:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF792109C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 12:34:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06CC7302528F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 11:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD6C36607B;
	Thu,  5 Mar 2026 11:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQYop4yF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJNon9ps"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3BA23D7E3
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 11:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772710446; cv=none; b=t1crpP8JlPNPwP0YbkHr+R339LlZfwPSMOM25p2RIANYWWpvL8Kh4euqhP86G27r1L9tR6rlcWTlp7bYZfAiTTDKZZEbM4zCjnzkNmnr95+yeS4aRpShWtHKmCPnZrUdqNl1Ln9QVClNuiObcWU55L4iBrmN4J3DVcW9X0EReYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772710446; c=relaxed/simple;
	bh=DK7rbmt0fdJaJXwujoUdrzNkqZH/Axad7pPvocVuokE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dEefnnsyVhz1l3L23PvI4Vmj1EOfC4U5Jy5g2ti42X3uCJOAygpJqetq/1t3nMFNA9+RHkCkXWZ1ykqw961rHCGOexAVLmjPbXmlXOm/xYlE0BNiFXkt2w89R+KgbPWqZqGK+tr1dxqYO3Xerqu3OGvj83/qrwN7upxCvcbFp5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQYop4yF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJNon9ps; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFjF6917159
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 11:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cSJ6/gnzvyp+MqZzEwrFuS8ohF6YfunLzHCMX8kNpaQ=; b=fQYop4yF7vuy3qOe
	SQNlA0GzPEYBIK6g9wicUqQfdMGRMSN4l0hcBfQszns815TIMW21nTuryuPvFAVe
	2biFBZXeMbsr1ZNTHbusT3vq8LyjivAAK4J/exGhVOuIQCdFeU+t/Oi4Pzi2acKw
	MiimDKLV+OEYf1f6mpsZ6V/FaAtwV75PS4ABZG/m3hVFfx6UUra9yrrIi6nyPTK4
	3dXNhKeygP/VjS5+9sbbtFiJV9Mkft0Nm9o0Cwa3DbneVjpYcenNDfVGZhEOVGPR
	3CqqkmAhs4w3bLel65Iv49QkRfVlATTtWjEA67k/O+tHXi42QH+hKoPD6wCJyZAN
	vVw7kA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq380s8py-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 11:34:04 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899fcb63705so20048066d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 03:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772710444; x=1773315244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cSJ6/gnzvyp+MqZzEwrFuS8ohF6YfunLzHCMX8kNpaQ=;
        b=IJNon9pse0WqWvY1HTJYlLLdlAb1pJ+MMuxngNQ4snwNFa3XGd/vMDPLrm+W8rKE6b
         FVPJPkxL+ti8aloDEoYAsCvCsWpz9/ec/VTSSE+vKAKbvJxgQSiOftb+JdnyAl9qQe6L
         KHAczCwvoMYJQq9Qf/vbR+M+ITuQRka1C9KH2qFJfQ56X3xCEpis1vbAQgrW7swGWiNK
         6lPeFhaHqSP3crbjj255+z7nRyTOejB7nC4skWMUBIusyOVBdbwNqsRPLaTyGmjsvbVV
         SFn3KYToPc8x+CVznLmQ79hACb86X9nNE4WRLuRkoUZgv4DXd62WClw/SGbiuA6Ly1aF
         qkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772710444; x=1773315244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cSJ6/gnzvyp+MqZzEwrFuS8ohF6YfunLzHCMX8kNpaQ=;
        b=Q5g4ku9nOpHRMI+YdchIkEANp+X8VshZ4sdoMAAb9XZ2SL1Tz2LjrL3Lmd9fJNrbFo
         iWY2eGMQjMxqxSVZs2PCnfHcPd2dfEIq5oVWtgeWcwZ0OpX89jgwbgzgtG8g4IGa+FDL
         qsf5asuZUy3cu7eEilJULTJVSJdXD8oOGzPSZPwjQn6wBGqsJiCnfYH5G7WlXKniExA4
         n+b9Ir3x7kv+UVxxFCQ5yDchOgkfnEQJjPBPltwA7K9n0dVd5+RNZzjJREhkGh15Rw8P
         Sgd/yqm9Zg9yfKTy1LAr2wq3vziWqogoxS4XyKw9qDNUib7tSIXMabaBd8xrCr+lC3Kd
         lv5w==
X-Forwarded-Encrypted: i=1; AJvYcCWKDzd2OEAyTJf9gA4rgWrfExo0WRZ/iSoPqhdDPRijk2t/70hv/0EZ7e3Zo/hq7JXnrBqKykLI2tm5k2Is@vger.kernel.org
X-Gm-Message-State: AOJu0YycadW1qWRQlMwyZBlwzKcPiusapMMo9gAFiTKoGYbRC2JyHG3R
	7bdmFooqieeTfsNYjVQhkqqWnCxPIKFi6xWchQwL73LILTLlwCw/mmD0Kfa6Ol93+jNeuSpW3EV
	TElbBeQDSaI2hlWo8ap1rJNvMMP7eUnaC9EkgBuQCX0a6tySfhoPIbuKkTkyEl7oUsSlP
X-Gm-Gg: ATEYQzxpZd01zS/e92M7iRfqLeTd7VtMYtS1A+OXPQIpzQ9miIpFzH9hYXdTCozfmjl
	mBQF/lxNjDEHbc4amYy2TDn3sAiRyze69aZZ0dycQHwo1vqJN00mMQ5QTYUYa+4ExU1HmGjZEQL
	IfrnPU25BLNz/gKvflbd3KZX8ru0tyebAoVhJWNhH3cudyGxdnBBW6wynXqHKjNd1JPJOAt2PBQ
	ACWoHIv2Nw595lbT17muXtZh6e+vGIDQZKbEvR1ovHuGi84GdQsdnAaZZyr8qJKEEQ8gRUkX4f+
	fPteXUrmerE4ew2UeYyDPblkQZyEysl5vGA1U5gjDhJQNvHFV1/0RpHodBM1JU/9KWXshuGAVZt
	Pr5g6QteUvXcw8n0QQumCWK/M1G7go5w+saMukYKhI40qrmaILN5pVqcuxSSo2KF7GFu6GJx7xD
	Rmh7k=
X-Received: by 2002:a0c:f103:0:b0:89a:f84:fdbc with SMTP id 6a1803df08f44-89a19d22811mr51378666d6.7.1772710443712;
        Thu, 05 Mar 2026 03:34:03 -0800 (PST)
X-Received: by 2002:a0c:f103:0:b0:89a:f84:fdbc with SMTP id 6a1803df08f44-89a19d22811mr51378356d6.7.1772710443302;
        Thu, 05 Mar 2026 03:34:03 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac546ddsm895276666b.20.2026.03.05.03.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 03:34:02 -0800 (PST)
Message-ID: <4d4cb697-17c0-4610-b498-04a3bb252923@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 12:33:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 08/10] arm64: dts: qcom: lemans: Add psci reboot-modes
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-8-cf7d346b8372@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-8-cf7d346b8372@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I5Johdgg c=1 sm=1 tr=0 ts=69a96a2c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=RY4SAwMzpmrxGTDjaQ4A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: xmiD_-YT3rXZXMZ0RlmvkRG3LxQiv8hj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA5MiBTYWx0ZWRfX7jOoq19NS4JM
 x8wfTfIRN/6BpBImoM5v/MqJTGNbE9EgD4CDHfBjFG7tTYp615gSqYkdI4olKTtIG1WsSdkxxMC
 LumIFUgQnYGUFMYWyhiHqRUa8Mhml2ynFNwoLgsobCOX7UJq/ViaebmXpf2mXhBdCFV76NZIOCs
 nB98qqsI6k4yKFCPMJ9vKvriszLEtX7TytyuE2MpqtzM+a0GMiYbJpFHbBooGH82Hpqay4uW8DH
 ITv/olsr/8WfBK82oV174+UmK/mbr1wHlNdgxVcDv0n/NwH2BAl7/DRxjU+0tyy1si1UAkVENVb
 gmQ/7vJ0LLmsKu3hq1kZxTK958UPKAUc8EO+r1netKDnmqIDfO1KFye6RYSVyFX5q/O9KnD5AbM
 hWij0i9y5vmvg25zPuPOlgfu2y38zm8XiY8gx8FZIOhtrkavh5TA/9Mx3K1/Aqj/d47tc2o8Jz9
 QA3XhcI+99Gu70g9aqA==
X-Proofpoint-GUID: xmiD_-YT3rXZXMZ0RlmvkRG3LxQiv8hj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050092
X-Rspamd-Queue-Id: 8FF792109C6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95612-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,f000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,arndb.de,arm.com,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/4/26 7:03 PM, Shivendra Pratap wrote:
> Add PSCI SYSTEM_RESET2 reboot-modes for lemans based boards, for use by
> the psci_reboot_mode driver.
> 
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via
>   the Firehose protocol.
> 
> Support for these modes is firmware dependent.

The previous patch only enabled it on a subset of kodiak boards,
the remaining ones do it globally, even though you claim it's fw
dependent.. this changed in in v17 apparently

My fear is that those may conflict with other methods providing
identical identification names, i.e.:

psci {
	reboot-mode {
		mode-bootloader = <0x80010001 0x2>;
		mode-edl = <0x80000000 0x1>;
	};
};

imem@f000 {
	reboot-mode {
		compatible = "syscon-reboot-mode";
		offset = <0x65c>;

		mode-normal = <0x77665501>;
		mode-bootloader = <0x77665500>; // conflict
		mode-recovery = <0x77665502>;
	};
};

will the syscon write apply and the (unsupported) PSCI_RESET2 gracefully
fall through?

Konrad

