Return-Path: <linux-arm-msm+bounces-99712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOGKFADAwmnalQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 17:46:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 524EE3194F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 17:46:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2E1B7304546E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 16:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A0293D5222;
	Tue, 24 Mar 2026 16:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hjBk/3V+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQLZYVa8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D4238D6AD
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369913; cv=none; b=Ij7QLXRKOSa3IqsK/3fI90ENSG+2d7HXwc7hm0pLCDMVw/ZNQIX0PadWG0pAFp6J9LehENYwWYPZ2bQwSPBGxuJiLzPebMYvCE3Qlrm9aLQ5pG7viYsVyTTbDeqVGbC9KbYM2rsYM/cM3WMvXAoHpxAmuen2QdEfN0XopKJ3Cow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369913; c=relaxed/simple;
	bh=/7s67FtLVQ7osFtoNaW8ycH8+kFQQs5/C4IOWP8ZXZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQl3PMAliTgC5gDfn5COiKdUUIl26FgyGppyJtMuBQ7gLf1iB/gOlVxLLM2f1iL6NYap4YL01GvgSGkvan1aLszaXwIONLgUJGss1ny2eoT/oyzeTVM5nIJ1MTjZrOdrPcKoQCYsx6QTgXS8wvFGoJeY/FlqskeWlR7DM85zJgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hjBk/3V+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQLZYVa8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OC38jK1817277
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c7CY9526LGiuXbFCoaaH0xLf
	puUVm/HTTCcdhq9z/cI=; b=hjBk/3V+9Q5LVkSu9Bh2FINyFGF+qzvO0eYqGfXQ
	aSRzDnV8MlIswbwF6yuO3m98OVa6I4vkfUhIBHbxNLSLqaaw/fI/N0zOyXafHSLr
	t9Znat/YV3R5EoGwcUtjaoyx63dTMegBSeWGfOvxoYF5dXatjOSKbnR+3zpOk+qE
	PUIseR4p5TB9RghUkOnOqOCOZKrA2yu8lYXvkXvViRs9NJUlLPc1YGt+Qgk8pYvF
	PYHqIq5sATfkxBTjdtkk3cMct5uTW0GHWWnu6duLpuZFbqhN9mlfi4ais4klcOOq
	d8UnXi66KN+KZN/C28mKi9+IOLCJC7W4dxbT+6UmhYFCwQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3t9eh3h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:31:51 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56ba44551f1so2911285e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774369911; x=1774974711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c7CY9526LGiuXbFCoaaH0xLfpuUVm/HTTCcdhq9z/cI=;
        b=BQLZYVa8i5a68DXdoSMqKycZKjEW7QD5GJP2zFUKTvFv+x/Kn6nwIaDypeXDvWckLG
         mR4FYaMLWwT9iEuPUO805Z9NV8fsNPGz7Vuk0iFcb6hp6yrArV9FSCPTKEdhmOgItKah
         cZuNF4ymcU4DqmJPdWG6rS+2c0cSyk0atlMi7tguxRgYGxZFfwpXU2h82wmJxWTY8HV8
         a0j91PUXx/kUzXGhyTwT8FFRZP1kLa+q2cqWnA7rSkYaD3OQmQPyv3TkjcZvy2iGR8Ve
         Q3+OWomxyHdhR1XUa0uCml8vIUr5cotoKnE7Rra+s7bOL0oDOR8/1jzpdBRV4xpBmYZ0
         /xbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774369911; x=1774974711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7CY9526LGiuXbFCoaaH0xLfpuUVm/HTTCcdhq9z/cI=;
        b=E/h0IfdwTu7AvUOMZaCuMXpuT63NYrLykefPRp2RJR/cAxjYfCBHfGEIk6kgVXCa+4
         2KPXyoitp6MKRcGy1eCDPjtjHJLoy00DEN+R3ECrqixB8nfAjyPi8sjEHwODNeTisZ7Q
         I7DLbTTmSUs5QF1EVg00lQttEKTnrduExxDN2tdtJFX0MjxfgSoQB5UAx8vC5XZ347X0
         FLesXBADpDpoICoPcsL3liXIgkgTzn7qC1042CAu9qK5/aEPsiuyY7S0lkMfH2RwisBE
         v5gzrzVQ9xs9Ki+DrU0cIfljg5puVq1/2JDVdJtChRgAsoXXdemaldJ/LduRS6+IysKV
         z4lw==
X-Forwarded-Encrypted: i=1; AJvYcCVEqAuW6GaGwmaj2bcmEjB6wZAI/n0r5v8xxF1KrLQ4xevYzgz/vw3NVdFDjju8EOw21eR2PESPseDGrAi5@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo2QFwOh9+guI2J7RNqO4v4LKk4YWXCp9JiMnHz73+rWRjkBw0
	02lmVm+VYpBDkUHLXBI1oZVldypgQw/Yx7EvmTmp7vbJYBcKPKF8NgH2oh2W+HS3O5mioq3Z9Lg
	GT/6T2MTnNVlPcpYmhafNbEsi1BCGNupKFYaD2BBILgHoE1NIYD4RqHZwjH2WtZG1rSpv
X-Gm-Gg: ATEYQzw00t9t6v8xftwJ+r/IMHZjBFSz1n5k8W7gISRiGHWOkMpmROdJ2Sz8u/xIYaY
	uRb6YjkdI4xdqZ6tV29QppdW/XFeFcmkGqHAeBUoyI7120pAyxMPNu65ImBKh1KwYpGmcxd0eXM
	BCkE+dyZvATfDbXWcCKmNZnunP7IT3tiaj+dJl5r4/M83FBc8FXsjtyxz4U6ZEnZ/EfqJPY1MJQ
	yaoDIsNdPAZumT3HfWciqNeFuFvflx/2yzpM5A5DcHimDhraKLHRLBHLjbp+LDQcprInvmhejGZ
	KFrisr6e7BmtJ4iLsEoVcHjLwMQvqKd0LosGBefXFjAjSv9SJG0YBrqPmqRcBsQqnq5JYhgJVQG
	DwfQ+8dHGe2Zt2o+Ro9mOkKQsIWego5TMlg==
X-Received: by 2002:a05:6122:f8b:b0:55b:16ba:2854 with SMTP id 71dfb90a1353d-56d21f7435cmr297943e0c.5.1774369910595;
        Tue, 24 Mar 2026 09:31:50 -0700 (PDT)
X-Received: by 2002:a05:6122:f8b:b0:55b:16ba:2854 with SMTP id 71dfb90a1353d-56d21f7435cmr297877e0c.5.1774369909995;
        Tue, 24 Mar 2026 09:31:49 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711693a08sm70578515e9.2.2026.03.24.09.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:31:48 -0700 (PDT)
Date: Tue, 24 Mar 2026 18:31:46 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
Message-ID: <ec4jkg4aaz2mufzluglx4z5zh3qh7g3oteiho27kux7amn4y2d@qzij5lc4tf7i>
References: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
 <20260317-add-driver-for-ec-v5-4-38d11f524856@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-add-driver-for-ec-v5-4-38d11f524856@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: SSQXvkV55SabuX7XfB8csWb1bGc3YJ89
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyOCBTYWx0ZWRfX8rIkd4QZyvEH
 ZBfDundI46ANlIVQVfSLfu6pTjs262TQ2x4D+3VolrHjxON8oMnlfYlh3+4D2jN4nY8FJp9lkaq
 gB+WY3pujp4oAGrKBPIsy7rCMCrWFXDz96nZmlaD2Jj/P1mmPsVn6dqw3yKexrS0fzWeE0p72XA
 2gGfP2zPdEDiJTcaafCXl6IaNXlGKnPhEKo7l5Zzn1IToN5ooFwrOEFNo9mQvGgOaapHe1LH3eB
 JhdTGsCuK4kvrUDqbavG1qT4eacoYbi88h7SfQ0xok/8sX5WdLOgzpR33IN1SwZznG938gh4rcT
 zLj4IAhGRoZDNui32JOFo0mkzZuDMbK9lm2+3bot4udDLbkIuFmg0IOd1b0oXMce/NGSgct9MUW
 9xFboqmSMv7MKDbuZv86NR7PbRXwJVlVLDiRXReMtriwZFXSq6mXAo2h7ww8G49jz+9NsuKaA/P
 ncVgulg3ByDDN85vfZA==
X-Authority-Analysis: v=2.4 cv=DdAaa/tW c=1 sm=1 tr=0 ts=69c2bc77 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6SiODLxq02sLjzxsB7oA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: SSQXvkV55SabuX7XfB8csWb1bGc3YJ89
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240128
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99712-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 524EE3194F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-17 17:57:58, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
> temperature sensors, access to EC internal state changes and suspend
> entry/exit notifications to the EC.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

