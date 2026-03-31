Return-Path: <linux-arm-msm+bounces-101105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEUMG4kIzGn+NQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:46:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 154C636F4D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1FA113094036
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 17:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132693F54C8;
	Tue, 31 Mar 2026 17:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kz2kc8FQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Te8OOsVe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B141A372663
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 17:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774978826; cv=none; b=tuFAzNhZ9yjTLMA8FSHzEcL+a2POhtwnWzsaMkDDNbZgl0ntNMlYa+Ab/xno9ZGSvL4dlffmdanlF8/cSkb41gmPPxnMwEo61WmoEXQuEZ4J5z4X2l8BaFTYhW9Y7O6hWL1sgsqhUjxrdOhZUs+Xd2x2utXgbCkfrBqxr0WLPog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774978826; c=relaxed/simple;
	bh=dOHoGdSrbxBMY26bEZpdWKTbAmt3hyzNOpR3Jxbvfuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GoKpqm9znFrgVSF08XkZ3Q3LloOx/o5/M3z2qkvZJEy6lwSorDCxvDiUSGOnJkiQ1VM7GoQ6Sn9Z2j2vH9VcPD5kFe34a7BOrTaiKrLj8zcZPmot2GgWcaIRkrnNParYmmkdBdoQPA5pQD1sB8GoBz4QfUth1HPc7GU0G8uZ7x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kz2kc8FQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Te8OOsVe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdLKP3882895
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 17:40:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	prcTw8kBLNsWmYJw7kmJsuCzftaG/a70zFO0VwJYO7Y=; b=Kz2kc8FQv5x70bYD
	bS7v9DqujY/zHmDKexrW8gt8skz9l5BfdRncBLBjCGsLFCSi830T9bJRvl//VNc7
	Qnn2zuzJvoEkhw92ySd0kWhAdqdFWW+wfGDd4LNO1eJiCCuvWor/nTF+uCGqlXMZ
	99wvqlcB1xCDkERzDseVmBwJrycr1MiBxzW2lrMK/PcHF9kP2xxQEVekEFFE1iHD
	Hq2btl9lpe/0j9dDb9WmAInES7QJ3J1Ko3KJDNkuuaLx7iBFu2323vV5li/r9KIM
	SjVPzGbxG6h+qgXY0pLYEX72JjVe7/2k2K9OrOfyKVDx7RP6lQOZ41ItVeDnnSSN
	VCAioQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89utaqds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 17:40:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c6929bd26so9879015b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774978822; x=1775583622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=prcTw8kBLNsWmYJw7kmJsuCzftaG/a70zFO0VwJYO7Y=;
        b=Te8OOsVexdSVAmyuTnyj13ig/0jKx637B6FgHRSJ+J/eqiL018Rh6hCa+ON8B55kGw
         6HE6x6D2fS3XrXfd3iPueLuDCjdbbiFiTE5STnlNmC0ARlpHUets1f5XAC+2kkxl3z8A
         bjoqOGSiy8X0W9IzBj36zQEr3PYjRdXWvyZdqkyU0eoupBuTLSdQHGCtzwlwJiY1dX4/
         qDnUXJhXjbsFgsZCC/UiJ9XNCaCJMIWDTgjxLPIADcTF83YcyDszSzYo3ITk8RN0h9iW
         fhzaoqb9bPqGYWOKxF/SgfjwhXF6KwIuIqLQ3QoxWtZnFkTDPK4WVeW9nZZ53o1wSOFM
         8+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774978822; x=1775583622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=prcTw8kBLNsWmYJw7kmJsuCzftaG/a70zFO0VwJYO7Y=;
        b=BYBnDvT9vCEz0tO0lP+inghvfFVnREviDRdLm76RImlVdeVnJLHCds2lgty/eMDg4C
         RRRtWHB/wznynS2UfhYsvN5+uH17UO1XTl7bo4HouUpRBod7GAvZF7gzet2PumkzCiiX
         q7i77N5CSZ9bxhoBL2IGF7hhclPmcQgjS68sbsVeHWDpHOl/gFD0vCZU+p/2tQkyGnZd
         qS1fxWfg8KZ8X2UIRmXCyz+pGKIV8SlPxTsYtIhMiGpmCag0cHlPso2bolRK1YrZSqfV
         f1XTyEy0oqVpYTrSNfV/9euE09tQurmr8h+6FNfP8rPOaJSgIA5BeAGwqgkWegHxOC/n
         tGtw==
X-Forwarded-Encrypted: i=1; AJvYcCWSlAL91gECgDXxjH/ztbaS4mvcgcuycxw9rW8S1ru+L2L0dUa2ISluOPC50CGDJAFrFMoU4Mn4BLLgMjsz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5TQR+lFuJBM61a2twfrvvhptwdqGFGXBis1+g0cdQQ9H3wkQj
	kzZZU9AajkHL4O1P8/jJapDpwkB4gJQbUNzScpnAhOyWF97FrlsBpHoa1M0ULb0rzDPASBpMGzv
	MAla228NKfnC0Ra42osv/MVAU8uCaISIvx9N9EppeIoznO4BmWEeq4k3MqOa6suxwAwxY
X-Gm-Gg: ATEYQzzo0nF+35kFS9EZhTVZxGUdfAkZV2+PF/y0fs0/h3k7Z6I5ePpIwLlfDanjAYo
	mYFPyk1MR5u/zanuL2doMAlxYmGgKzLMJEOOSn+Th2jxgSkGRDWeBJ6XcGTlPrfMVsj9lF4IQjQ
	NL1pQxvVPHwCQlGQ21yhMAWY3sr7S2zic3MnjkvvBCGo3Ykn59yGYMNZd7YMvfYEPiQfzNdqTiz
	Ev4GUB+5/1fc2KPwLy51CM5e3L6GcARhqYlU0o7rLz6Jdy5U7zChsHbB/VK38EdgeD+MoDSZcpe
	ApJLkj/ViY7Ve3IqJOmWya44YsSYc6JgX2WZni9E4C/TZ8poDsyZ1Iuv+EJJUSWtFoaG8MCKTCM
	SSUwGRxRNU9RwcD1CzCtNyFK+cioXo++qmUzWEqdtBIRhXbSXWuTFHB8=
X-Received: by 2002:a05:6a00:44c9:b0:82c:d7e7:2f8a with SMTP id d2e1a72fcca58-82ce8b296c0mr488231b3a.39.1774978822193;
        Tue, 31 Mar 2026 10:40:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:44c9:b0:82c:d7e7:2f8a with SMTP id d2e1a72fcca58-82ce8b296c0mr488201b3a.39.1774978821720;
        Tue, 31 Mar 2026 10:40:21 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.225.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85fc756sm10032533b3a.47.2026.03.31.10.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 10:40:21 -0700 (PDT)
Message-ID: <4836ecc6-611b-4f21-9213-7aa6ff0a53ec@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 23:10:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 06/10] power: reset: Add psci-reboot-mode driver
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
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
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
 <acaQzmVhO50oAbbE@lpieralisi>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <acaQzmVhO50oAbbE@lpieralisi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rzPUMz6aqXa8ZQqj2uhKeaY2uFBYckdz
X-Authority-Analysis: v=2.4 cv=C5LkCAP+ c=1 sm=1 tr=0 ts=69cc0707 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=mO+zk3XXGlxjkZV6yCQMJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=lfiaEQAQ_OMEnm63DysA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: rzPUMz6aqXa8ZQqj2uhKeaY2uFBYckdz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE2OCBTYWx0ZWRfX8huVqA/s+3VV
 90gN0WPPG35yNdybKdFt0HvNyxv1qKrvgBURyxfntrrFnDwhT7sMiG5sWmZ2NlCkPycZgHymTIj
 6tvst/4WQerDIl4YehdVawjVhkHrNHxJxeB3f06gOmEuVcZ+S+ia3xq+0epGCWDgvA/JyGyF2fJ
 bIW7uOF7pQqvSDSf5fqPLQOK77vR/ZRNZTE9IhPBSZvpQLQR3qmaUTzpG1T7cIjnD78sSpztiL9
 U+KZV6E9ofD03aAXaohjwD5pJKdt7kQRnZjGHM6ECU2jrDQ5xjaz37L9pWzlBB2Jt3wGFFOrxYM
 aFMtDVdrkFlClzhvBrUmrvSHqyLl6v/fCsFcvMnsau8hMJkF69fNrgH3l3KxmhndRoc8KPqN4wi
 ivEZlyC7HTv+vhsJ4GUm7ujIs9zFRyD3VXjrxSkjJ36AYcZN/Myxa5tesvN2dB9nwnpt5bRUk1D
 W98Y05NotZvU3Fr/cjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310168
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,arm.com,rock-chips.com,gmail.com,linaro.org,ettus.com,broadcom.com,oss.qualcomm.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-101105-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 154C636F4D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 27-03-2026 19:44, Lorenzo Pieralisi wrote:
> On Wed, Mar 04, 2026 at 11:33:06PM +0530, Shivendra Pratap wrote:
>> PSCI supports different types of resets like COLD reset, ARCH WARM
>> reset, vendor-specific resets. Currently there is no common driver that
>> handles all supported psci resets at one place. Additionally, there is
>> no common mechanism to issue the supported psci resets from userspace.
>>
>> Add a PSCI reboot mode driver and define two types of PSCI resets in the
>> driver as reboot-modes: predefined resets controlled by Linux
>> reboot_mode and customizable resets defined by SoC vendors in their
>> device tree under the psci:reboot-mode node.
>>
>> Register the driver with the reboot-mode framework to interface these
>> resets to userspace. When userspace initiates a supported command, pass
>> the reset arguments to the PSCI driver to enable command-based reset.
>>
>> This change allows userspace to issue supported PSCI reset commands
>> using the standard reboot system calls while enabling SoC vendors to
>> define their specific resets for PSCI.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/power/reset/Kconfig            |  10 +++
>>   drivers/power/reset/Makefile           |   1 +
>>   drivers/power/reset/psci-reboot-mode.c | 119 +++++++++++++++++++++++++++++++++
> 
> Add an entry into MAINTAINERS.POWER STATE COORDINATION INTERFACE for this
> specific file because I'd like to keep an eye on it, if you don't mind.
> 
> Creating a MAINTAINER entry just for this seems overkill to me, it
> does not look like it is done for other reboot mode drivers.

Ack.

thanks,
Shivendra

