Return-Path: <linux-arm-msm+bounces-90942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNStKb7leWm60wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:32:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 686D99F823
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C2F230234DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 10:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADFC62DB7BA;
	Wed, 28 Jan 2026 10:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xw0avsZ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H0G6o1QE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69E023D7E6
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769596331; cv=none; b=DyF68Sa+6uhectZK1ql+5EGSc7r5yJhUXISICGZGqx3q5h3lVRWPjYque5QEJfm+x+7OwxpBmnY/4FvkmfdUJHNg8J3vuHjG4HfQ9T7qm6ilEmv1NJ/RbBMeadfaK+s3t4So39aiYs+lCqWpBZkyn6q0iUJUGEQKvubQBaEe+7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769596331; c=relaxed/simple;
	bh=+J/F2oQJehsoQRqIKCYpsNnvPFCjkfmJ96drZJAQSzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VrGt+CRogvpX+5tLofosTBohW1/8UOmyLlHCwtfrEgVsivE6KB5ap5/C/DIONzc/Bx1lNReii4YhDPPX4gCAqP3w2IPFfw+yaUAStlbclmEtM/TC+Bud+SfZ2awPDczosDz6RKJ27+S2YGgTY8FfWAxTBdG7jx6MEmn2NBpCpOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xw0avsZ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H0G6o1QE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S928dM811672
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AU2oF+z9GTROPljq8Aoqg6hCJb1JgFZaGl/dYuc+Tz8=; b=Xw0avsZ/QLfNTjZm
	t1YMWHpkOf91i6NOrzZ27jphthu8O9QyYU1nS9TU6cclJ9obUZm7MeJaj/U0abWV
	67j/KT4limL4yTrHcFJryyZgNkGSSj31NxPmohwxchmD/BbkZx+ZD/RqVgQlrV1j
	EYmj40OhD9DMbSjWs6fQyyUO5sjsQXoM6Kx4KChwP5TaFbhFPRAIyYrtadS2kMU1
	ZIMFwoDQSqpcyUAMrP863Pa+bcP0E7pkp6UuW/dVB4V00FFKHAIk9gXqo9apGwqV
	5zuxmyUZ9CQREpaooHlRKbG1yp20OJ64er8T9h8sJTW02QmNS6s4amUNDewnTG/6
	ZqzrLA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by6qbj2u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:32:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6d6b0f193so140603185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 02:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769596328; x=1770201128; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AU2oF+z9GTROPljq8Aoqg6hCJb1JgFZaGl/dYuc+Tz8=;
        b=H0G6o1QEH7Ei3+rumXIMASREHomm4UX7e3O77WOHCGRX1YN8bwo0nvFKpFf8yPc4b3
         fk/vIxI42ewMJ481z8UEc0g1OiKn11BcQmzpYldH/jaiaFnZZSaOsB+15rPGDgZv6LV5
         b2DV2PJuOqTWxePOVUMgJFsIW2DsdIxEx7n0BpX3nVGhT/L/3cSHo7A6U7zDeXWAS6dy
         sSk778Rje6FzY3R9tVsRfQwZi/cGX7F2DclOQbPPRxMb8YlAPH2bkDwqiqKuWdQF/iYD
         UCD3UOOUAM3Yf3Wkk8A1M9mCVTOzypxljEQw35aQWwOqsrr3cU+VgAYoAbaX8hzvDwjK
         63Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769596328; x=1770201128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AU2oF+z9GTROPljq8Aoqg6hCJb1JgFZaGl/dYuc+Tz8=;
        b=eBtTPPukT+5szEGgeSPAj2NFru76PgIGy1ugC234U1rBtcpJKYOiqBQ9BQ1yHGK0Ru
         HeTLw8/cF4zpFFNRtRaA2zsqCt7kPONhqVAFucRQwxTo2SWvpQYudTpGb+IXbXamNccL
         US8NJo12iyUg7a7NbeVHiDpyu4qeAkJGJZ1Yiz+DzbnqQ8/FWl5PApR9QQdzRQ7LCLLX
         s1DM17TVUxm/VdOt0LPcDnpMNzy74JhGEMw/++Fn1HsX6ARDGTCVgWc4Qr+e5s5ezc6U
         CkBYPZ3C0TZUIdPydNAzn9cqT1UwJawfsGNc2wOHOmVEFguJycUOgoUBfP103BG/CTFi
         Lt5Q==
X-Gm-Message-State: AOJu0YyA+DzsMaPRQd2x5DholSdq5ZjomNx3mHZImYMAyDONMXeJ7Ixr
	YoqAghExJ3kP/XfufJPXuH5ZYzG6bQ/iEx1Pu1m3Ic3zkynp72E1jVL2ELA05gRY0nHnaMLpCWD
	4vXCGOqF1pfz7VEcdYv9h7QtJG9tnhr7nEWP/05kPCuggmzc/owNXe+HajSqggyYwFQ80
X-Gm-Gg: AZuq6aIQTwlIzJ4efmcS6gt4dvzf9khsTcnqzDxRmK/toVOgVCggLzXdLu00Edd3g/q
	DN3+kjUTYzuTH9nF65hkn3GEKpa2vK/NYWxgCWvjCKfIraQmw5NxM4qmd27dxSx0prAcu16c53/
	H+JwlDUi4hOqpR0F+kVLJ2UmyhI6xiIsmp1Uz2QZGsCdWkUaHPE0Z8MBsC/mFZfpXs6s3fSw73Z
	wvEChm8jBiD7bQE92EhqZPzp5zDrzfuUWYHTTy4ZDqA+ceNnH0QmUSFQwjEmq0dItbOxjo0YLXo
	diMyETr4w9S91YEHCv1zLQSPWiGSWE+aKanT7z2TpL28TC5BmNUFR5I/5IZzjcWo5JbHKz6Kun5
	+pKulhyGh90j0iaws+p+WOFgyx5FxwcpuExojxNY5pybb3MFsYS/dKWxpulMzY+zEHmE=
X-Received: by 2002:a05:620a:269b:b0:8c5:33bf:524c with SMTP id af79cd13be357-8c714c262b8mr107051785a.6.1769596328011;
        Wed, 28 Jan 2026 02:32:08 -0800 (PST)
X-Received: by 2002:a05:620a:269b:b0:8c5:33bf:524c with SMTP id af79cd13be357-8c714c262b8mr107048985a.6.1769596327483;
        Wed, 28 Jan 2026 02:32:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c02d0sm108684466b.55.2026.01.28.02.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 02:32:07 -0800 (PST)
Message-ID: <8e95a0a7-effd-488f-a381-d7c827e814b7@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 11:32:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: talos: Mark usb controllers are
 wakeup capable devices
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260128062720.437712-1-krishna.kurapati@oss.qualcomm.com>
 <20260128062720.437712-3-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128062720.437712-3-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lpwcjUD6PfYn0QMnBj_GQqyl1mZAmJhO
X-Authority-Analysis: v=2.4 cv=Z4Dh3XRA c=1 sm=1 tr=0 ts=6979e5a8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qED3yJuYEiOL_LFd3OoA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: lpwcjUD6PfYn0QMnBj_GQqyl1mZAmJhO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA4NSBTYWx0ZWRfX/q/I1bAPA3Ss
 f/2uE6qXFpCnqzx8dfYUWlYXFyt42uRsh42CzQcGzTJjAaxJKvXRbcI9wXxg9R67fMhQEVrMGSh
 azvtWU4gsI9IPxc5i4bFhGrwCDWCIEYnA0+jnirJO8QG2J48j3GLNV4BbLKG1Ygv80pxRK7otK+
 n2ZIBZMairozr7YWd40B0xYcoKYYwmmVuPzMaUGFQAgLTJ6rV4QIBv/pXx3TVwoPDVP5VWZ3LNg
 8jvAzc555YAeuxKutwuibK0tSd494y2MHeOg+PnvkobQGvt1VnrxdSHu7dFQCFYgtQkTwwPVdn/
 o7hQEYRtzVUu/bKTw/MPcndl4NbmcMP8+nDui18YHNQWt07fyTbmLkNODNJ5p7jT2sibbgdkWVe
 89mHCDJm6LxBBJ+qQLCez4ejzQx1HhADUCliYI69K2V2Jl8IrQyK3E+tOgujrXsv/GaTGhBvNFT
 8Lbqu2mcF8Mp8j8wFuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280085
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90942-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 686D99F823
X-Rspamd-Action: no action

On 1/28/26 7:27 AM, Krishna Kurapati wrote:
> USB controllers on talos are wakeup capable. Hence add wakeup-source
> property to both controller nodes.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

