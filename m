Return-Path: <linux-arm-msm+bounces-94504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAlqKcjeoWlcwgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:13:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E85A71BBD60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:13:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CE3B7305F496
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 18:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCACE368275;
	Fri, 27 Feb 2026 18:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ps+SP5Bb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MEXT5+5I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28DC36BCDE
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772215961; cv=none; b=NUifaIeXm7EqIZODTmG1MOADZ6g2bmF6ZyAzCFtMb622tGJ8AtwhLZNbon3xBZFSQxLvFmDxISvmX3FYGQCcGkmNK2oWPE2qCl0vERRbaKsBNiKf4gb1pNv4s5EKg4GSiHbzzln+2wmfT94o/wjYHIvMBHtMYycBq4m8EMSknrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772215961; c=relaxed/simple;
	bh=Mp07cWmk77gJ7z5z9T/v8YlVgD/43oRn/xdabRybGWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fenTvf19a/b6+/1w/2VpyTg6FyggPL2vQ9Htb5J+AXjb3NYxdJU7m2NwwtZO6Tt5AHfkhaOPstQGstgZOZs5OTpZ9HsLew186bauWHtyAiaT6OhhymFtlns1vE8QOmqEgQd6ek5cK1bm8iEhT5U1OjPW0xH1SNvnyWIL3wl1b7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ps+SP5Bb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MEXT5+5I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0GPP065303
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EeUpuU6hzKl/9LxUCkuv0r/3BrJkugyblkXzmOdXPzo=; b=ps+SP5BbeVil3BOt
	rY+08K9rqGpNRNI95Vuw7m52K0TjcASPSXL12hSA7RSwbEu9d3hXOytvaPQTR8Bf
	ja6pgrFVAUQcqJu96NuDfJQoV4+gidbme2ey/KTOsygE7oU4fymtArrYAUtZSb9n
	jZ/9RuBCAv9GXXZzNE00DMzsDSUN3YcxhSCKCYpsTf/EuJ7YmP3sdEmoboWW0KXR
	qjuhDPZUv50PhZ61vnCkoXNyBS6rIJAx2dU49YpU6/iSJExww/1l6RiJaqD9V1a0
	4VS6tldNJxzUCDDgiZ370OPhxEu6lKzrFzxsjFAzJUs5p+xFlG8BvBCgjXp0EFuC
	BM1k8w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cka2xhab5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:12:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70c91c8b0so228187785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772215959; x=1772820759; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EeUpuU6hzKl/9LxUCkuv0r/3BrJkugyblkXzmOdXPzo=;
        b=MEXT5+5IfW1YdqIW+lzHU/NxU8r3XzlqagLTqNpaqPBDixE9dYUl/2pFb1SXRjh2ZX
         blktXKeqIDLjmQp2C+KQydGaFlC9Rs3ZKe6bHAyinOwu3Reke2HCFfE5A/PefSfjY6XV
         wfObzjxL7iIliTg11jXjxWPxkrR2XbRPsfSenQR8F/mp/Dsu0Xl5zUO+AnEGfhCtG+Ug
         xy3spPsK/NANXmCEHja2SFBtD6AiBbgIp31HjaJ9j/+LSkfXi+MWci4XJav6e9dHZOkd
         1PcovmnetZNh28WAGvSVUsVEcnvvKF9GpwD7LrKSSPJmvGbTgGKhEF7CGji75ioWSy3C
         EZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772215959; x=1772820759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EeUpuU6hzKl/9LxUCkuv0r/3BrJkugyblkXzmOdXPzo=;
        b=P/jvGvgFUs5CPurgrNYY272lzIAc1vdFeOnueHH6Oj+iSah+Y6yv1Vyi60fQ6vOAiL
         6jnJSm45VSazh99Dp9wFn7FJRtg1j2gp4jNXZWWmm2etQNsWv9PoNL6OSaeHMuByWRVQ
         1nkHOcEMpicyZkptJrkoEHGUUnjAZslume6saFmWSsJl51HdiMUO5xJV60eHzp67iIzR
         b7OE1Y0I/b0gspP5G/8ABc9FTkgzUOY+Jgy+eyVLDrqUoVVvxgKa25d8z/y4n9uSJXTd
         4bHUoKBJ8HM8EObUTWavGbTQlT0sLA6MkgGNGdE1aSHLqyTydvlIqf0wOtVt8cwF2gjY
         c6yA==
X-Forwarded-Encrypted: i=1; AJvYcCVrqLuKR4KH+SytRreV+asATKpsGUUHBarqP64hQwElse3DcJS8zxCZUaKVSlVTYxl217rUtVS+1y1ZOQBZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxxmpgLYK1D3vg94YND6lccE1awV5Z9uzABKj/Fbh3vSA59UgbN
	HD/0yVTj07z4TCh2StsslnBBrh8C/BAYQEXNWf+9Z0NEC/JtCIzIgO3W3U7YJXCV2J6mHzjaoVZ
	Dd6G6x/K4/tii/dBZHFepz93eM8h/YRbVPl9HiWuI2kIxGqE/KOnoFTIcF72hSZSp1AHC
X-Gm-Gg: ATEYQzxexEvBeng7gbOEWWOWMUlixc8dokmmn6aU9VTbbyD20ZZ7hEyOvMT8Jtjd37u
	IknFIMsl5PkNomm+ZP30Nj4J2ZtbSXnY9B8oEg3z5AaUqffSNAeXUt+vyS/7KU9Y2OkGf8kxtZ0
	b/BydyDRqCs4z1Q/iTuOQcrkDYv7q2YT2wwblDihNWjxkux7LOW8ucTXM/mfBGsRPwRALEA+HnT
	o81yqvCDiDYG+QUznBYObaCJpXlqwomaqILftcofM7EIek3DCN2k20ZnaLtVBCDI+v4Rhme/Xbz
	gDwUwuNtetTHRDPTn/A+nOuowlmlBGRYODNlLscxK5LdQPBzDY6VJlO0f4fAoVdqHLh+3EeonIG
	cepcdtJTOxkwd/qZ4Eu6+n30Yi8RNABDfhHMvX1HZmkHJQyCabV3bptzPbeEBHcyqtT+P9NqtGI
	SMbfA=
X-Received: by 2002:a05:620a:294b:b0:8cb:3a1d:79fc with SMTP id af79cd13be357-8cbc8e510bfmr356128885a.2.1772215958966;
        Fri, 27 Feb 2026 10:12:38 -0800 (PST)
X-Received: by 2002:a05:620a:294b:b0:8cb:3a1d:79fc with SMTP id af79cd13be357-8cbc8e510bfmr356125585a.2.1772215958425;
        Fri, 27 Feb 2026 10:12:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fac07b7c2sm1455963a12.31.2026.02.27.10.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 10:12:37 -0800 (PST)
Message-ID: <17c89413-4ffa-4a06-9dab-15c83a2accce@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 19:12:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: ubwc: Remove redundant glymur_data
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260227175613.164637-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260227175613.164637-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227175613.164637-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BOC+bVQG c=1 sm=1 tr=0 ts=69a1de97 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=A4qfhe_Bf-PYTsNBS6UA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: nJ2qpJ3xVjJCyTkdeoMGAQFZqNd0yfR3
X-Proofpoint-ORIG-GUID: nJ2qpJ3xVjJCyTkdeoMGAQFZqNd0yfR3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE2MSBTYWx0ZWRfXyENfGpuaj7p0
 23EN8AEnogBMtQdE9F+mknfDzXeA+NhyHTk2Kn7q6ZkfepJqLUbUn4ab9d6W9I0AV5aLTFrkZKn
 Zv0F6Nz6Bd2nYEdZmpbWTI07z0jZyUQcy1GnyebasVf7aZioGap/M2zMl/4R8WSu134/4NhHuxx
 A5GBmlRGyVdjhWQGmTxzjPJWFFwN8d9ZnMuZVmZmFCLNZiZ28CTUSNsni78iFdsw0MZtu1XYHPM
 p8ARvvh0gsB5HJs1yoqKZPictmgU1uF5/zk0ou3QPAOTnee9ogCic2NRwcouzDr9W06z+X6twyR
 0XFkCjDRNE/MJShX+y6aqZpEARYmzVTleWZYllhvgFkTFGxL4nytgeylWCOUbnh3B2B5IyWhsw1
 kY3SgulL/kQ+W1hUz9w5C2OnXnLzrh3L9bc6BDD0FeCg3apZbrv8V7iItRwwEfsQo+ZAf60IgPI
 tJmkoVszn8Q3+K547mQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270161
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-94504-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E85A71BBD60
X-Rspamd-Action: no action

On 2/27/26 6:56 PM, Krzysztof Kozlowski wrote:
> UBWC data for Glymur is exactly the same as one for SM8750, except
> representing same ubwc_swizzle with value instead of defines, so reduce
> code duplication by reusing older entry.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

