Return-Path: <linux-arm-msm+bounces-95606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIrrEeNiqWmB6gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 12:02:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDBC2103F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 12:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AABCE30A0349
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 10:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C49837E2E3;
	Thu,  5 Mar 2026 10:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tw124HDZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aI0DBvyE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4C037F8A3
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 10:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772708231; cv=none; b=YmDStxZHKWYI2NLIBOR1u2TAkD9+9NfvR10gfy++StW71Tvo36o5EB6h9of4aja0/IqqKqYvLhWv2ct85ZBp73n+bwN0yoA6GNdI4yBpS38tesDWWZyRvwrKgdCBbVXVLZh88AGg9jo9ptESXGmKrj8wqydJdHn+vFzaFP++F9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772708231; c=relaxed/simple;
	bh=WvhMDdJEqXsBieHTg4qjo45DhftgJst3gBgjhZUT0GY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KmZx+MuhnCFhk8mXz0Ec55MW1NtS3khncnJPDTv+6rE7RkvhGVY7m+64Eml5GTrlEkg2WzMTTd2YaCNh6M3g+cTq1U2olkwgSbwPL7edM06kaPVGSCtQZCRD5ruShe5/TfPKDqrLkzmy/iqmq1Jk8k+YssAjbWgzL6CYzIFkzTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tw124HDZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aI0DBvyE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFub41517997
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 10:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BhLz5z0Vpfhm4H83owUtlVJk+BAJ6aTwTqUMB6W4aJ0=; b=Tw124HDZ5WZZ+WdD
	NkgiskmJRIVeVUyq0S97hI9IoGIjLrDmq1Hhi4ecL3vL/WXWTkhRn/V51ZU6zlJh
	Yc97hRqYllWyniyNoahXTp0sNtVwO/kcJa+GZxDvo/Slc1dyrYD/+AHtRohAWRSe
	bMQi6SuY1WVpwr9dp3huGaIEoi1dUhOmzbcIfx5yZdInx7koGA0kcarA43qXveFJ
	7xISEjxmNzS0ue2SlfraiB61t0eRl8bLRmgNOG5De0vvvtVVsJcuny4m3rasZevN
	EJgJwPxmQrmlnnzPABhDsiOWLsZVZCwIHN5KjTuTVlXgEoi+bcBUSq7sVx1Xnoe+
	Bp3TCQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuptjdtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 10:57:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb456d53a5so616059985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 02:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772708227; x=1773313027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BhLz5z0Vpfhm4H83owUtlVJk+BAJ6aTwTqUMB6W4aJ0=;
        b=aI0DBvyEzXfRPpT+dgqND4iAUpqPQYojY67IEVPftWRPV/pCi4W2E50NHQY2/gWMvZ
         9xxTklcEfTKX5DYEIIObMVyXLi3ScV87F40ctGNc5DawCEsDrakt+94lgiGWKDogFgv+
         Vo4ga5g6gZQ1NP1UxTlK7AxtXuccbDEwfkz46V539gOBbNpISC+IJ88ChbVuUosntm1y
         HRI2EE85CJlSh0jahNI0FUjvu8aNw3JtIHvBNOFV+p03RZHHgbVWzGs+S59DLbjd8jMA
         XfcE9AtrGLsngu4a5lq8yZSlJ+1HNgnHVHAQO0x/nMMUg5kVVFETJ69akMGvKR4/UlM+
         hfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772708227; x=1773313027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BhLz5z0Vpfhm4H83owUtlVJk+BAJ6aTwTqUMB6W4aJ0=;
        b=MvB+isi6phWAvmU8n0nT0of8yQXvtwALAV/jlGHwJX7Uq4kDrSBBkPVVbyV2HQvdPr
         P8/4tR/nUQrz13/ETVScd0YGAtw3QTU3VRoiB6nxj76BuiT4GaSyK3fec4jA3RF6whbj
         +HG8ZgzzNEuIXxHA3LyOl7I6BMK7fog4AgrzP2g3ao67Y9j551yVUaLivSPJ9OtMTtOR
         sHhQ4CZpf14to++PVJ2aeKPm0qmhURJ4LIIRC88OIqKkemm/OHlwy0cqAQ7TNDaxybbW
         tBbqzX7ziUrtigqY/8Tj0U98CBbZLiWJQ1ajChjSFZffJ0n0zJkGxGFA7mxQ/Pwfiz52
         TBNA==
X-Forwarded-Encrypted: i=1; AJvYcCXk/rpEKUDLUp1ZlM63heIjGwSJ4/ZWc4zdH/eS2we+6sSNpeE8euuaHn5GemmN0hEMkLYsv0WwHTV68Ew2@vger.kernel.org
X-Gm-Message-State: AOJu0YwCz3whC2n2zGIzUYRbTrn4POP+sysXy4ENLOCpeF1CH0e6CPmA
	V02GB5R8K5Er6uYBo9hB+QYMvBZMN0s+r+lEOrkANvBZZ4Ipcdn2mn8QQpVi5mJWSP8wYTeQn/5
	C2KuSDYVeWhmVb9n8KVNbKK4T5/LIXM/cVdBB2HFtkz4YWQfqHqRZ6u26iXdH7rHvWD4q
X-Gm-Gg: ATEYQzy484jXMem6zncQskYtpyG7goc8xEij/lw0zUQZgimA2ecyi+NbCX/MTU52y1n
	iJaqL2Ow72yq9EpJr7bBPlTwx+iTBCr8lOZPekw1349AeczXRvLTesnK2d7U7Oo1aDvoYUh2wkm
	arNRykFNFyoB6FmeuAwumUpNli/VttSF7zd+YIIkJgcQ4bUkcb4rxub76SVdY21OTkFpzwTik/N
	hxhl/PeEljnP6UT+VeF78UhHWmTBz2J7BHVU8VNcFjQwstIBwgebnIuXaeiJTbEvOD7U+0z7PwG
	JMkfEKkxTm9NwCX2haOsbuWfS5YoadEBG27WE6up64gyOwZNbk8cNWcwrj4UH8TcC/78YB2Kwe5
	JcdbdS85k5gb8SAEjYJ2kaDvOkpiPrZvfkPw1QwOXFVJNgy3j1qNTyGIooO3P+JxXnLgzHwfpd2
	6vzQA=
X-Received: by 2002:a05:620a:3f97:b0:8c6:a719:d16f with SMTP id af79cd13be357-8cd5af1e137mr550342885a.4.1772708227093;
        Thu, 05 Mar 2026 02:57:07 -0800 (PST)
X-Received: by 2002:a05:620a:3f97:b0:8c6:a719:d16f with SMTP id af79cd13be357-8cd5af1e137mr550339785a.4.1772708226576;
        Thu, 05 Mar 2026 02:57:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b94061b1426sm98165166b.2.2026.03.05.02.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:57:05 -0800 (PST)
Message-ID: <686932a7-4070-4d6d-885b-a3dc57e3ecfd@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:57:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 07/10] arm64: dts: qcom: qcm6490: Add psci
 reboot-modes
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
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-7-cf7d346b8372@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-7-cf7d346b8372@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4OCBTYWx0ZWRfXw9wmJOSPH7d5
 QmcTPH6Zd4w/sKWTEGJahjMbwqt8lAaiOGa3MFXEAVL8aO4t0eaMB+P4PwmJNkzsutfT/yYO3/H
 U6OlDVgaEe/ai+z++3rbBuhvyJuajsslXJ7NV2Bkhu3sAhtNGR1U0ayIijM2n+ByDDiBkV5JON4
 /4flbC+km1GWvtSfI33vwacAR6TBkO7T7L6yimKlHqzLeQg6GF8psPqOAsZURMT1YhPQoLwXhzo
 l5e5oVAXfaSHJ46KstOqgRsBhcaTfnZ7ahUFB7Efqbj2/lhBfa+2mcBY3v4Vhh2hNm/MABO8Pxe
 mq8AXGKQeDHKgLzOozVbi5kD8bIRfDICDdSf5etJcNBfJBgwesrlDlxjXYdxqfp38GdhC/NOBrA
 +r2B7PTiljq4vnzB6I5osndI7doFrqkNBuq8Ed0JoIo+l4+NX6pGYmC9mObQZdfTsbbx+H+oWXv
 mboWqxZMr+YD5F2nq5w==
X-Proofpoint-ORIG-GUID: f7tMYJgWIytfJksSzHWiuzOVsHEo48CF
X-Authority-Analysis: v=2.4 cv=Ddsaa/tW c=1 sm=1 tr=0 ts=69a96184 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4wuITOyn1pdjjq_Hru4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: f7tMYJgWIytfJksSzHWiuzOVsHEo48CF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050088
X-Rspamd-Queue-Id: CDDBC2103F2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95606-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,arndb.de,arm.com,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/4/26 7:03 PM, Shivendra Pratap wrote:
> Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
> for use by the psci_reboot_mode driver.
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via
>   the Firehose protocol.
> 
> Support for these modes is firmware dependent and not available across
> all sc7280 based boards.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

