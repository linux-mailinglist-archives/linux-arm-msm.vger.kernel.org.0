Return-Path: <linux-arm-msm+bounces-103133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAlgCuYq3mmSoQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:54:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AA23F9A52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 51896301AA85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3873CF689;
	Tue, 14 Apr 2026 11:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f534vb5O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZpHUlBzK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F45539EF21
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776167648; cv=none; b=RLhU5XEil5KPVQmc3lvXzTO9gFIuYS9dt8NvekYopEhFUyT4ROKnaSPxZ9Tab8epaOjfyBEWDV1AYG8LiFqsOcd+JIlyf+DIueemL9jgegAK87b4jJdaCxDfyMi97wl48UjSjjdBhAvWmN+plbGH/ktJuKirC/XGrZBkEvt+Xyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776167648; c=relaxed/simple;
	bh=GdMiS/Tl7YbnC39vU83u5nYmklXbOLR5AdPYf9UIsFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FowvKXAcp1liTJBOFHIHBOIMFSS5wY0a+iwa137mSvTxN7SM5jqTIBEcoq2KwvGHjGvw7lOv57LvbkqO8eIEwGbKwrFJpOSI1UU6Wl/J876DCdP1JdZEVaUtsacnp7jBqqNIdCWjxtZw3SXzbmO0tcs4utzeqwx6ah5NK/c+Rds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f534vb5O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZpHUlBzK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6kNl42388809
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yhT9Ri3SIupvnGrhBh2Yg8tT5ZZJLGba6sAUft3NN9w=; b=f534vb5OVkJcD+0G
	ExDI6HV9YNQKyms6AjI49wDJsme6QaMiKLmyX7VQuAppakFP7x0E9pdARMRF+mfR
	GpECIKDuVjrtP6HNSO8GuK64GVd7e3Eb8TM/BiC4OgP/o9yaZKXzDh3n6CevJbBJ
	c/znYdDiNioXBwFbK7Zdj/wliAgYf+UbSrfRQ/fsCkx5+s7qhORP7fg8D+/ecZp1
	OqF3Xe4BbB2UPELSVboackDenewfO2VBBtB9vuby+nO2myxmEXpxU7A2K2O2VgWY
	4Ta5kucpl0B0aSSP5+S9jNoMJ1m4XWKlIhn6UqQJqrdxi8uOJK1hQByhEQ93DwA4
	M89yBA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86w2jkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:54:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cff2297253so151027485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 04:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776167645; x=1776772445; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yhT9Ri3SIupvnGrhBh2Yg8tT5ZZJLGba6sAUft3NN9w=;
        b=ZpHUlBzKsgPppURStSqVtFwxPefBfdv9Pr5H8TOdn6CMYQCCM5XmJugIyo+PtEk20k
         SOcLNit84Rgbwx0RHe4D3PrBctz4ylpaQeCV1IkymOSSdd5mdFn4dOQS31YGfKAbBGah
         rOjVA/DcVwwhVVheJderCCmddZOvnCBOGYMf1RAY1a9kP5+tvraEJtO31B3t+3aF2skU
         xbLtywD3/XlPB+dK4KMRZAl3oGS3/fv8ciQHBEystASkH3TMkKQMpzKtk9sfVq5QCrXX
         nbJeWL+4oYuvw+AKCf33RgVNrhAoJ9XsR13Z3yXO+F+3KkH/Fel0UVPV5+4KRbOZ/BCt
         XWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776167645; x=1776772445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yhT9Ri3SIupvnGrhBh2Yg8tT5ZZJLGba6sAUft3NN9w=;
        b=rR4pVX8v/2nzGaUeptuJrowOwyK2mwAm6XKI7qnBgmBp/BXwZ9DDS5hGBBZWZ9I7MU
         QB3ayVpWrHFgtciPGI5yCdi5SASKQhDRj/Ai4cEYWB8g5rU5BMm4uJ3Ny5aUfBC3eyqL
         zTXaef31boWWjAyWsmgGy9js872OzvCobs15LsPAx0DGemYByPVZOf0Hkh6y8EXlqfdn
         7LUWyGMI3OqmnD2Aq6jJttbvj9naoQTAUOdlw7GEvQ8kjVjeMsxDhmiPPyu9lGHs5HoI
         xjv5wfW6cm2cKs4YLYlLa5HiVEljKjVFjLM2py/Lbrpczd1rnlqWNm90q4z/a2n+0rc9
         K00w==
X-Gm-Message-State: AOJu0YxpgSZHbymJT6nPgiaMZcfetDw8QJqjbsADL332DeIGRWRIeoZW
	l6erwXxOUhsO2eteW+wz8UeJbENYIeyswSVRhQntK9oyZ4UVH8UfeitBDgCSq5/tvwRl3E4Kd6W
	O8nmnjlO5a+B+PahQs1ekl7cHHLVkO1RiAwLa3val01BQR7e0CWNrCNf7vIUK7p7tYSb+
X-Gm-Gg: AeBDievt5WHE5lkQJoFLsyY24L0XR984cDCpyg444mTTHW1CFID0shmJ2Mpap5nmleA
	k3AeIAZY9h0/2DMwlvW4jXiQ5o4SXF3pNd2wvy1k9ZmCO9XKp38Nn6QDnyRZ5P+TQysCw7FNIqS
	An1xVkz2PGCGsss5qpCuwCy0hWDGLu2teQFMLTOet92YnREQwn24o7q6bo6Dz54KDcJm+NXh1B/
	xC6WzO2LKjlVjVaaj5kSCAKXS7YQwvv9HOLt0az4mm0KzTjrfsE7mYiz7H0j9OSmPY6PqHK+3N/
	io7WDsMcEs+I8R5cdwN6Gxe7LFq9w/+bmfXKnU26qv5bEeJRRI5zWjqqimQb35BMQEmulm3TATV
	MXR3twsqXuK64LqSvC143iB2kNEqOLdy5HEKbtonhES4Bt8uAeB/IARdRLtksLETOPkDIFNhhzL
	8apOm77+zJLkx0hA==
X-Received: by 2002:a05:620a:4411:b0:8cf:d953:b4ec with SMTP id af79cd13be357-8ddcf4b4a29mr1756645085a.3.1776167644520;
        Tue, 14 Apr 2026 04:54:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4411:b0:8cf:d953:b4ec with SMTP id af79cd13be357-8ddcf4b4a29mr1756641685a.3.1776167644119;
        Tue, 14 Apr 2026 04:54:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67070815d27sm2964601a12.24.2026.04.14.04.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 04:54:02 -0700 (PDT)
Message-ID: <07ff689e-39dc-4f3d-b68f-3f3942916283@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 13:53:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] arm64: dts: qcom: sm8550: add PCIe MHI register
 regions
To: jsandom@axon.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260409-rb5gen2-dts-v3-0-be736355d4b4@axon.com>
 <20260409-rb5gen2-dts-v3-1-be736355d4b4@axon.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260409-rb5gen2-dts-v3-1-be736355d4b4@axon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rQQyyifvYxqEFDa-mPof1q3Bsgk2BrqU
X-Authority-Analysis: v=2.4 cv=HKfz0Itv c=1 sm=1 tr=0 ts=69de2add cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=h77gEMGJAAAA:8 a=EUspDBNiAAAA:8 a=mYbSqgcRFfY83x1HOF0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=PYyYjrCoJcZo81GydsRF:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDExMCBTYWx0ZWRfXxAlNKWkIzrHg
 hrvesWPasOh8jR+5PH941dp46C1B1h5M8TlEgNRxYynoApb4p1x49b8q/aKYNaD1p98h5e5hXCQ
 SOBD6ken8PhXsSZjbLrWQdv/RB174Gd8SLBr2AAuOpJl0BVP/9xZ0K8BkRXNXOPbWgIZXtcfwUk
 iHRxgQeImvpPqsDFiKWUyj+ypD+WeU78B+HZo7JYQQFWzEz9wfPxAri2PRhc/tzbKN02zWLJa3b
 45tCJ8rFbvasgwTyxdNIsNC5IAc6qZmM2bBFszZDdp/sQ1OhR2XgsNPmhCgbN37beVjPUMAS6TW
 6zLC27mfbphwr6f12iEfPRNvM9Xy/g4XgWaFV5J3RgZMC+xZXAua09+cYfDV2JKNhiY8VRXcDe+
 HISKTjcYkwJFhf/a3UvqNHSGqLKnueuLLse93hrGVSPeCROktF+h6kCHXx/R0xgjOEErfwj/jLv
 C7QBMLk5QIzCkdxSGHg==
X-Proofpoint-GUID: rQQyyifvYxqEFDa-mPof1q3Bsgk2BrqU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140110
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103133-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 30AA23F9A52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/26 5:26 PM, Joe Sandom via B4 Relay wrote:
> From: Joe Sandom <jsandom@axon.com>
> 
> Add the MHI register regions to the pcie0 and pcie1 controller nodes
> to expose link power state transition counters (L0s/L1/L1.1/L1.2/L2)
> via debugfs. The PCIe host driver uses this region to read the
> link_transition_count from the MHI registers.
> 
> Signed-off-by: Joe Sandom <jsandom@axon.com>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

