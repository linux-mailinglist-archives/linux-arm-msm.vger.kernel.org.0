Return-Path: <linux-arm-msm+bounces-109003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AL9HHCbWDmr2CQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:53:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 031885A2BA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:53:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2011F308542D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4204837A481;
	Thu, 21 May 2026 09:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nBQ+8VkJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G2lCOmf5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE82737C92B
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779356898; cv=none; b=hBwGG2JGin3XOI31juE1HZBtsrYtXoIoUkCTVfQLuhaAAUh6jjf3usq97sKdUlxIAIX64aX+nSox0wqLKJ4a7KIBUNl6smpgyKufz0kmfNs1W4hexgeWx8sGa8aZMjPntGAezSuW4GmtmFFUq8aAoM+r9susfPa0M9dICgmH0ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779356898; c=relaxed/simple;
	bh=30KdwVED20r+fi4uj6Wme+Z0tWvnzRKuTPOpd1R4+qE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t28SX9Tz2Gn2a5JVjnOLjG1x3s+VnPgonZjzakFmR+J5vy1NpO1j3YTxQMdFuDLWxp9oq0t8Q4shSJ5YxdAtJ0s3zHxnxqV7OBaKCDQKvfARuf7ROr4Pr1ojd8jCJavRp9OmoqlWt9yoP3CFD80lpW4ANzZQXu8aR4cqSOWgXG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nBQ+8VkJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G2lCOmf5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99vBQ2491830
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+4PqW8WIFajA+ZFM71MofraxJOsZX/Cj4e7yQPjwSPQ=; b=nBQ+8VkJPqY9HIvg
	pGAl7e+7H5an5bP0bqwLNgqO4S2i/P68tSnOUDOV6gZYYbvV9lTW1U5FvmqJf4zC
	MHu9nsEY2G+8J6MFn9PcQioThD7p82STUv1ahJUEHAI5BNkYVVuyyy0kD05r0QIf
	34JQmgFDcfUnwmRB6aTAD1+isHA6uNF/7DewawIwqrpw5suRJcArRdtvCySpMM4/
	eTel+73BGiL1vecqeOYFP4EX6n+4/MH+ValY8GKbZaoL8ALN/NYP21xelQfaUCjr
	Jph52Ldjdp13Rr0UUs9nsKGCRrVoTCnayF7kPRkbiwbxYutZUdnSzHT45SJivxqM
	Cvfqgw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j4b2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:48:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-914aa01cc21so7198685a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 02:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779356895; x=1779961695; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+4PqW8WIFajA+ZFM71MofraxJOsZX/Cj4e7yQPjwSPQ=;
        b=G2lCOmf5zsBzqdIjEJlSgqGrpMI6i6otXjASCf1CbffNcg5lIATw5m96KQQsz1Am3I
         mL8uaNmwkIloPJu0nhJ7xau27OV6SXvQ1O1GCH806+lvm1XbQQkjY6zBraMAIav4Rz3i
         OzvErkcD3AwJ5RzFhsvnHeXw8iRvJs9Up8c2w7GCEVeRJUYgC/kzYs+3zhe17uMvcp9G
         RGL5wTbXyLC3RsWW2IurZI89FDwUz4NJApiouRn89lVc/8MItahAaF8AYDMHbGIsu+X9
         gN5DDJNY98Flo4xwv9dsj3CIZX4bsgcxdARRCpYvoULWcP/P30QkxGbuct3xmBoVyenT
         HaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779356895; x=1779961695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+4PqW8WIFajA+ZFM71MofraxJOsZX/Cj4e7yQPjwSPQ=;
        b=jBF4jY/pO5+AT7uRuxpkS5+Qmv+sKQoWKqtpJW5+AjMdW4M9tKbk7i91tER1gYXPnk
         rkwf7PslnDQQPqFMYF/DLKsBwuaEvVN4zVomc7lJQHTR7ZqtiQ/EQg4F0hirw698eNeM
         Y70cWcc13IIK1UwMO5BvPHTTN9PqXX9ai2UVd6+FrHpODY6CE8Pp7+WlDQ6u7uYlUrM0
         eJ6ZAw8WXanW4Z1oVqKb5i4hewdyaID0veZjpTTlZxkd9iIgfMVp1ZQcAO2OtubDk8vK
         ND1fFCDnnrX5RqDS+GwMmmQow4r/8zoGJz7mdgxWq2uuM8r+q+/LrBJgxIx9ks8hqMlJ
         U0dg==
X-Forwarded-Encrypted: i=1; AFNElJ8G4vlKatYIC2AL4AFMEtJtTaVEN3Vy3RywE4VrGiRSKkjQg1iPOBBzX3b8Fc5CftFJLeMzVAImDU6P7FzH@vger.kernel.org
X-Gm-Message-State: AOJu0YyvfSx49gNbjpq/luoCoy22I9S2VSxcCmNVoNKc3ru9LdvDDBPK
	0r03c2hogAhPGpdDiOLVed8gdaysYzJzioADMwGqG5Fk1D8KE7pPj0jJA2ae3mJM5PwprxxPGez
	JUUS2mVINU329N+0Wqf0cC2mj80nsQLMz8mWxBZmVG8guVBj3Q+yqErnHZdvzphSKaFSo
X-Gm-Gg: Acq92OGnqggyGRitXwBclCUlKmrgQmFYp/rfBnsONpQ2WObvYBZpC7fJfhJQU+WIGkn
	GdinHtb/7lsyWDyeX214yvdH7uHhHOoxey4qGO357ldkaXKLlrJFcMYv7oa/4nMLZXjBlJ7fFhY
	uxjc/D/o1MiaV73IXewY8NPSEEkZCGqy5Dzb9xPIsN8be5N5gGN7C8Z09mybGhMBTHhJ6YbrgGb
	3R7qQ+NHLnu5DzIuSWpH9cwpJzJ6ylrXvnroOku0DlrhMK+XESx9zp53hPD7MIRY2H0WtVK/vrP
	EkofkTHqXlUhGGpz20XqsRuFkE0hvOyBIFZIy5FXOMWQpk5RPsLWPacXbr9YdROfyUHLEEa//t0
	w5bqcuPRHkNIy8kqnk6BkJj/1YH7PpUfUTZU9butl3tej1gLDxBYfgu51L2p5jldVQgZIn3m7Rk
	dI98g=
X-Received: by 2002:a05:620a:17a3:b0:8f8:cdd0:df67 with SMTP id af79cd13be357-914a2d44cd4mr156232785a.7.1779356895167;
        Thu, 21 May 2026 02:48:15 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:8f8:cdd0:df67 with SMTP id af79cd13be357-914a2d44cd4mr156230785a.7.1779356894691;
        Thu, 21 May 2026 02:48:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8aa017absm23207766b.42.2026.05.21.02.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:48:13 -0700 (PDT)
Message-ID: <3de365a0-4632-42ea-8a8a-5a4765945a76@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:48:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: dwc3: qcom: Modify interrupt handling for eUSB2
 Phy targets
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511094422.3561509-1-krishna.kurapati@oss.qualcomm.com>
 <y4b3qbt4xhnahtfmfw2qx3lazlnogcp5dfrpd2wyicevoc57p5@puqv4wjzcijn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <y4b3qbt4xhnahtfmfw2qx3lazlnogcp5dfrpd2wyicevoc57p5@puqv4wjzcijn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0ed4e0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vFx1MZsNm1lD4CY-f2gA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ovBQuDDGOc0UVYWf48p4NTYANweh4Zc9
X-Proofpoint-ORIG-GUID: ovBQuDDGOc0UVYWf48p4NTYANweh4Zc9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5NyBTYWx0ZWRfXxGyMTKjOLYvC
 J8USnc9xb4KvIi9EmyzSBbWcFKIE8P5bPl0T2kKJPAZ0s+aKk78HJVmT97fP734aQtmxoW62DQ2
 2c6+d/ywZaIbMmXnvw3M59wC1OI6H9x8RN8BFdqv6v/UZo+ImNejvJzLSsF4LeIM+hB5rQb1h8C
 yolW9uWqKaqsFbaqPaQO82BdmvvppucqR9xMS88UHTUq1320W0jP9pvOaK9Loam0C+C6wjTUBLM
 xZLrcrBslIkc0uVXuSFAIT+efOy8bAM8ZUwdGUmh40JKCLpwtzIJk5yfAgEm1tK9hxjNu7hdxqe
 nPoRf+q3vpP2NVnBepG3iP0jmJEHdVlbyR7ueSMzS6FV2rKjAa2ablyXESBaNRHo2piiHUthes7
 HHZgt9hsxXfQj4sONqyS3qVY5iHhiMP+vMKrO1CaVpTGFuG7wiEgo6eOn+DQYldeZvEBNPUJtZs
 SRqSpq4m/dZhWJlW51w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210097
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109003-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 031885A2BA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/13/26 10:48 PM, Dmitry Baryshkov wrote:
> On Mon, May 11, 2026 at 03:14:22PM +0530, Krishna Kurapati wrote:
>> eUSB2 targets handle wakeup interrupts differently depending on device
>> speed when operating in host mode.
>>
>> According to the eUSB2 specification, remote wakeup signaling in host
>> mode is detected via different data-line assertions based on the
>> connected device speed.
>>
>> When a low-speed device is connected, the host repeater drives eD+ to
>> logic '1' upon detecting a K-state on the USB lines during remote wakeup
>> (eUSB2 specification, Section 5.5.14).
>>
>> When a full-speed or high-speed device is connected, the host repeater
>> drives eD- to logic '1' upon detecting a K-state on the USB line during
>> remote wakeup (eUSB2 specification, Sections 5.5.15 and 5.5.18).
>>
>> Since the eUSB2 PHY's "DP" and "DM" interrupt lines monitor the eD+ and
>> eD- line states, configure the wakeup interrupts accordingly
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---

[...]

>> +	{
>> +		.compatible = "qcom,x1e80100-dwc3-mp",
>> +		.data = &dwc3_qcom_glymur_pdata,
> 
> This would result in the list of the platforms keeping on growing.
> Would you mind instead detecting eUSB2 by checking that HS PHY has its
> own phys property?

I think we've had a very similar issue on some other patch.. we could
use phy_mode, but it'd require first fixing this mess:

28:     PHY_MODE_USB_HOST,
29:     PHY_MODE_USB_HOST_LS,
30:     PHY_MODE_USB_HOST_FS,
31:     PHY_MODE_USB_HOST_HS,
32:     PHY_MODE_USB_HOST_SS,
33:     PHY_MODE_USB_DEVICE,
34:     PHY_MODE_USB_DEVICE_LS,
35:     PHY_MODE_USB_DEVICE_FS,
36:     PHY_MODE_USB_DEVICE_HS,
37:     PHY_MODE_USB_DEVICE_SS,
38:     PHY_MODE_USB_OTG

into PHY_MODE_USB + submodes and phy_opts

Konrad

