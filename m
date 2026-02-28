Return-Path: <linux-arm-msm+bounces-94650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oK9INb1yo2lwDQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 23:57:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB091C992C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 23:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 472F23013A8C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 22:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 616F93E0C43;
	Sat, 28 Feb 2026 22:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CSOApqdi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QTNH/sSd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDBC399025
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 22:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772319398; cv=none; b=olc1V9TmQmo6JjLi2oITcKI62e5BoRIhyNhSO8f62NhqFU7mwEv1gsgMcJXFlecNNgmf5h3kj4eZJU2JfwA29/0FhCDBdDCr3YlPB/zFtqDDxa83Wpc2Fp+OEvjBz5HfqZGdev9PN9HhySJB09/dFcQKFpsXDnxGGLkyi4zr7wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772319398; c=relaxed/simple;
	bh=0to7vhhq+B412ZEDpB00zyW6kcLfTT9UZXqBM4lMOq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQO1KuuEqn3npHgH7F0/W0T01knwQuItiq/k2UZKeIuK00uYR6cUMhPh3cR0rSxS/fU1yW2+NE3VcX7zdrV2YBhRczofyZI97IoG5D2+Gujxed5rG539fhZ+1igLNUPjmjq6k7yKPbWklebgNUn3ZFqPhieDNDcVDKdif3Eu9kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CSOApqdi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QTNH/sSd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SJtG2A3313722
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 22:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b4pYfF+M7yz93dnlVJBi07gc
	hDf83ok3euGd5IPDsJw=; b=CSOApqdiKSc0pFHC9suRa4wej5IkfT293uXPKqJW
	W9/PAxewk4+V5PaPFPCwBC31kSA8zfa6NeKD2k+8G6b0GaL/9BzUFi3wZgouq3Op
	LECVP3MXycPpsZ+gGR9/XpquWiqM8N5qnFjO9vglP2Qd4teNpK6Y47KxVF2WQinQ
	Gg4Dxih9S7/cnqEuymwdhwsvVLehmfeHbbw5oBlnxCf4AC+QHkQ7QJbFxzkzAL5J
	UKbOXZ8RTbX/VkpVP8gBaRO3jyOiqxmiufTkD9D3/Q48yiaQJKStafj5dXPwYOIu
	cgjJD1QZCNct7nMYeWpgTb+OkPXi373XhH3Dm4v0aFQg+A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksg71p3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 22:56:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70fadd9a3so3446989985a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 14:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772319395; x=1772924195; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b4pYfF+M7yz93dnlVJBi07gchDf83ok3euGd5IPDsJw=;
        b=QTNH/sSdGpR9pdR4YdgzUCV+v31UpmNyT6zcRDhhVtUCS/dI1QIyyIorV0bUgzpIXd
         7iNqzTIEjdm6cRZ49kO1Rbj/qG5XbXWD8+Dd+QjwfMrghT28fAb7NgYv1mIw3it6fbk5
         iVcOg9m118Xh+Dwb5KJ2+/aUpZxrPtxSKlcV4AJNYSxHdeBltIv1VhbBO8K1C2/PAh3R
         iXsMcxm4DZTsSzdbhg/DmeMcgOSuM+Tv6VsXo8va+TUBYXLq7KBOJN5bRI1gK9EXccXz
         Og6BqZijJ4GzYEHGqlfeKoet5rhXWZC4GP1Q7+9gEo+RQMb5MNiwoCRdPxZW/9s/i8uU
         98ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772319395; x=1772924195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4pYfF+M7yz93dnlVJBi07gchDf83ok3euGd5IPDsJw=;
        b=oz0gUF9ckMjom3PrizxCl8s8OZiOI4zYhQN12z7G7W0aSxmFj1VkvA8g4+NrXBclWs
         uAOGMWctKacM+Mn5J3R/ilOpLmGk+r1mnEqcYz0+CLnbNWDcSRRISNrBsPNWpt032pG7
         +Up4nUdkLing2EaGcJGhHSlKStwU5yIbCfoJmoUeL5RavjojGtSrwcYsvhZntER+K29Y
         TlY7La7FwOE3azAWibyYd9QEtSVHUiQet5WfawoTQZVinRjoELNYnQEA4i3LyhDPTKPW
         3CsUs2a6cBMvFG4Jfc8MF7sTxTCq1ggltuYlkYHVGb/FVducNyQv6frJNzDIBW9yuna4
         kB5w==
X-Forwarded-Encrypted: i=1; AJvYcCXG6zVZ17m6zyMie6g0eJD6SK+zcckwV7j9Tj6bN1rG+nqKemo1R1ECab4yCk2CgnqBiUkIGVD1ha61Z7+L@vger.kernel.org
X-Gm-Message-State: AOJu0YzD5f6Qn+pSPnPqV/mOFNBYcPzPdME3P76pMI3t4MpQR+gBoECX
	QMYsfHQbLDwfUmmzdqnBGRH1N4xbTL5te3acUmkoQRYIfuDniGf/fsbF/eN4Mdp848ZwYVmGV0p
	6qwPdMBW/ki+kBpu9FmO4xWAIndp+Uz/BrhALLEdtK4GHAXPYyo4lsjVBDy1+o+vBJ83n
X-Gm-Gg: ATEYQzwJBvFpVOfGaTbFgqAqPWJBpbEsWkQO61bUWwqIbwp2I4P4xNVMPXKbrPO1h8e
	VTi0nwUuyx/riF9bK5G0ZxxjA1Dz/qO/J37prAD5wmTj1Uq+PbXeyHFwDlDSmthHQSrwoKOokjU
	ods4sxwyAwTLLZSZByeO7ChPttKdfWr6pOsJdwYs/j7nn+D3PQhb0D5ioc3ZRFnPkgF3MRu9hoK
	/KrRyN8xhhXld5eWFC2bgs6E+Exh1feoh+kIGbUYpibqsfHuPFUKVPj8E7oFuJ1jXWVt3hc6zmw
	IUFuciNOf9wKBUTuBXp8tFBaz1S/hbd+CVt5hR3ABYzbe2w46lM7+AqUAbgvyH5MgWayHpWQFMx
	EirYhcIp9j8abnR1U8yJs0lR7BqWAs2VUrX14
X-Received: by 2002:a05:620a:199f:b0:8a1:21a6:e045 with SMTP id af79cd13be357-8cbc8ddec9amr1020536685a.19.1772319395413;
        Sat, 28 Feb 2026 14:56:35 -0800 (PST)
X-Received: by 2002:a05:620a:199f:b0:8a1:21a6:e045 with SMTP id af79cd13be357-8cbc8ddec9amr1020535185a.19.1772319395038;
        Sat, 28 Feb 2026 14:56:35 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c597578sm15910926f8f.0.2026.02.28.14.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 14:56:34 -0800 (PST)
Date: Sun, 1 Mar 2026 00:56:32 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: x1-dell-thena: remove i2c20
 (battery SMBus) and reserve its pins
Message-ID: <7kvj56n26hmhaybuzdfdrn4odqkexyggpzc53mjjcrepl3ep2d@3f43rkjhvsyh>
References: <20260228205818.13016-1-val@packett.cool>
 <20260228205818.13016-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228205818.13016-2-val@packett.cool>
X-Proofpoint-ORIG-GUID: YLmBjPxM0mWjEiwSWFyq_9mKRxj-H0nJ
X-Proofpoint-GUID: YLmBjPxM0mWjEiwSWFyq_9mKRxj-H0nJ
X-Authority-Analysis: v=2.4 cv=FaA6BZ+6 c=1 sm=1 tr=0 ts=69a372a4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=yBDt1HprIkPjxvyg7igA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDIxNCBTYWx0ZWRfXwMby5+f+LxHb
 suMbwQdKrG8HDxftcWgtIUHCjAxSVLobvaiMyLGnqLKm6fY2iMM4GQV2Bvnwir30pSI0KYDlzQY
 Ji6B3TGqlXXot8Y21rDg4IwRbKbES4sObyQ5bpK/zgSuUz0KzIQW9IUQTJag97+fTcAmOvrEjur
 6SwwzjoE8EpicuHzkNkswAUuxOAJYZOj5V15Cf+u/MzhfGMJatQtqC+Z+yhq59q6iSTraMcvgW8
 8fgxHT8xjLhqopR3SsImBR12PExyoe7GCn3TzsTaz0zoqb62ayPb5fCwzhp8USe2wp5nQPBR2ru
 5cu6exifJYzVaiELmmokFVc1D556/bI0fPaQtSSS4DU/4lT8I584vWGQcoF4Ll0MM5CqFYooHOF
 iklgkYFK2LV+kaVL1LVXIkFn1ZgoW/MGQ3GGgMlQsfRsk52VaeBXTQdMrcuvlZoczBoEryMaVhR
 Rgj9E54W49ICjAnwUbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_07,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280214
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94650-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:email,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3DB091C992C
X-Rspamd-Action: no action

On 26-02-28 17:53:57, Val Packett wrote:
> i2c20 is used by the battmgr service on the ADSP to communicate with the
> SBS interface of the battery. Initializing it from Linux would break the
> battmgr functionality when booted in EL2. Mark those pins as reserved.
> 
> Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Val Packett <val@packett.cool>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

