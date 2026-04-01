Return-Path: <linux-arm-msm+bounces-101306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKMBMZ35zGnRYgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:55:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E6754378DBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D0B5B30B935D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 10:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3401E3D34B7;
	Wed,  1 Apr 2026 10:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJ1HH3/K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BE78VuUS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB003AC0ED
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 10:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775039967; cv=none; b=DJqRyxHHIYu/FRHNvGhxSS15TQz6gXM36hlZkk1v03/koLu0VgXY5Q0vh/D+h5/j/gwjqoaSr/7vbs8a8eW1H4jW7xJw/5OEnLA6I5U88pm6iRhAtW+cZZctMB21ymJxnekdzakSDz01BZtEXOiUIYzRGqW5Qy48Ce6GnxpTmR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775039967; c=relaxed/simple;
	bh=nQ+4p8OsGuZw809xd8Eq9zhMz2sZzX8LN8rIvBt7GIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UKF0YJyKpdvISuA6GECVoYpp46IFXmeN0CT8U9YtaqmaV7M8heVH/GilYZG9P3UCFYD3fsKQgBBvZ+H3RmGQY87U35VtfgzSn7Xz0XiLWIpB3T0Gig2bWmHIea58RHhKvceS0jadrmUK0GSfKHQ0rNdaM25aiEcXvMx8WYECwrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJ1HH3/K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BE78VuUS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63196gnw1460261
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 10:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CdEHA4DQK22SZOiThoLAaxq/9uTTHTJylEC9OtLnGBk=; b=FJ1HH3/K+4RqKsD9
	ESnJE2pA0EsnBvibYt7HoDEATpOanA9KYtkTUKaSqzCy/9OsgpkLUsqfupbq9MhT
	GSENwweAbTm9GKqCsFwsRFtxbA+ZukIXFuZ6+8R19iHyK1SIqj9gk2qzXlrysD+w
	jDA2tCz2mCUM3rToBAaZ8t6eST9MoEk6B+S1vwXRHhjk32lkc7t0WP09aD8UpcWR
	ZaBVQvK0oZxWiML0yZ1eu7W3eRar+Dtmfy3JZvN9LHttshfqWwtuae7iE/qsBJhM
	qZrfKlv9vIPCUOheVHe6A/piDU9ted339dTaYxktXZwLlJ+0teRWQwpfxILYpeIv
	t+zHGQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8uhg1p13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 10:39:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ad179c7fc7so19586315ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 03:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775039965; x=1775644765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CdEHA4DQK22SZOiThoLAaxq/9uTTHTJylEC9OtLnGBk=;
        b=BE78VuUSdsH5vW/pkIQOIYqShB5CclwS3SZv0824k+LUx7Uq804sBehDY4XNbQ3U3h
         k270Uf2yLFafv6EN+4cu0oRMzl16BxuyrQIerm7tDPMVnvpXD/x0sO3QY/l3pdXzDbX4
         +cCkFognRlacSbrKHjhrIeH3VMcgggDmNx9DRdcuu84ejHNyQ3C5qonDHRAD3RBbyZBz
         xvqztPTSaSNIJB3RRT5tc3HiGRmwZ3h3rTnd4xwKyW1PkJ9W0TT3dp7v2r9xd9QbLGuQ
         AWkc6PI6psOBjE0xS8v9EfrMLGAm2XPVKOF2o0MGC/FQ9TVwVlW6fHWYwb592R6lAFLN
         aTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775039965; x=1775644765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CdEHA4DQK22SZOiThoLAaxq/9uTTHTJylEC9OtLnGBk=;
        b=X0YGWK9RLymPtKxR2O/wEIWIceZKbUGJpeK+Fb3fgmUOBn5tcd92eDU/KL1UdgICNI
         lcci5mhXY3zLx16zJKz5zD5wiVUyn+fyu81hBJJXAsRQVXZYp1oFLMQY/ijvjRVnzxYH
         kKiISi5DmCpFEbpSwnZKjqoY2CRNx6/+xTMoIo7XnApyOt7Bc+6K+TnqUhUweEvVXtN2
         5tMld7zIAs7owN9SeKC7YNb3R1kacA3e7avytAdGziqUiHr3wgB8YbMu+hCJIeYzLN2k
         qbN4y/AyDmPpU3vCq+geinJsI0kYS2ImKoyW5fQObeRY0Q+OsbD1re/JchV1Xyo3Pg++
         MFAA==
X-Forwarded-Encrypted: i=1; AJvYcCWXZ3GKVPtjbh/cz3AEoa0rpJOBGkDEpPyWb+8SbBG7vf/2cpDaPt3y+Sdoe43IcaT7dn+MOFQCLf3DL0go@vger.kernel.org
X-Gm-Message-State: AOJu0YyaE7QzL36jnY6HhAJL2hFsXu6J4dRHlenMvzS3nxgTkAFLQ5kr
	zFZZi2wyDXCHcEWej1loVR61/FH2RUfckHPYpSeN/gXJBPxyobiqBWlKlEx3TNKaIuU0azo2A9e
	SqKJF9ZputzP451CASsJ3twb0eouft3kcu3VcLJsWDT8Sm7HWSRboQhNC0ln4y+s/8w3S
X-Gm-Gg: ATEYQzxH3nc+oTg/Qm/Mh5y4zRW7XC9sub6kQQq0qcEae4Lmitz+i9G39WZC0k5KPWk
	2hVDTxrqGQCECnyZr9T0uAfVbL2zpNZjuKIVopZbri0BShQwFFFvESornltnBsh+TYRc4CN0U9b
	dsE0MFj6dmC0/gecP0MXrj0js9Xu9ZuB2rMnzL30yfvXEkCvOnJF19I+24IYxVZWB0bhB3Jtjux
	nZ8G6yfz+N8LCbp1T9lW4DdMjqheKkgocw7K68JRWpQI4XsNAqZOnj+x+Lcx94fO4csID0r6yc1
	cj/xGkGBD4ptXtRjYHW/cXuupsr3zzK8pVl9LE446hKox3KUpFOOIbB4oY1FKFmGNIwp5NqQJGY
	x2LZ0AkE2s2oCMggpvuBo8OTKRofCr7MXgTGdsqWEhC4PZEIRpoLQ+LrTdqQwHoCJgsutMlVzbF
	gPkjeC70do5ofD
X-Received: by 2002:a05:6a21:7a86:b0:343:c095:c4d6 with SMTP id adf61e73a8af0-39ef76644bcmr1945373637.3.1775039964588;
        Wed, 01 Apr 2026 03:39:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a86:b0:343:c095:c4d6 with SMTP id adf61e73a8af0-39ef76644bcmr1945341637.3.1775039964112;
        Wed, 01 Apr 2026 03:39:24 -0700 (PDT)
Received: from [10.133.33.205] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76bdaed389sm2016215a12.12.2026.04.01.03.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 03:39:23 -0700 (PDT)
Message-ID: <bf1df5d9-787c-40e9-93db-536612982427@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 18:39:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: kaanapali-mtp: Enable bluetooth and
 Wifi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-4-70bc40ea4428@oss.qualcomm.com>
 <b5ogt5phzzifh45zyvzbressexgp4se5m7vvgmvaf3ed723hww@qovynwnps455>
 <13745334-c2dd-4a97-90de-a5ee18cff6a7@oss.qualcomm.com>
 <hyy65v74scdekci3kdowxdcujbmoeyx3vxv6dahvif6rzhloxi@rirggsitayqv>
 <ee38eaeb-d408-4228-b7a8-bc2d6e4ef056@oss.qualcomm.com>
 <c46islnlfzdawtw4o3holunf2a6rvfs7h5dznaggzptatdlqc6@7pjbwcqdtccl>
 <0279f334-95ed-4df8-9e42-749fd854c551@oss.qualcomm.com>
 <3xb6ya4zxhmaode3u3al5r4g3rfzlq2ifbyodvwtr3qgt34pwc@ia2xqfaeufd2>
 <ed5a18f8-04f9-4c4f-b4a8-9fc2a277ac40@oss.qualcomm.com>
 <ohg7jn4lozqw3lhwmhpx7qyiuw2pmjl7zwv6cbbjmbr2vnnw2e@qz6wbrjynbta>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <ohg7jn4lozqw3lhwmhpx7qyiuw2pmjl7zwv6cbbjmbr2vnnw2e@qz6wbrjynbta>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5NyBTYWx0ZWRfXw4oEDs6L6VUa
 HuFQU96F8o53CV3NA/TQfe0s33CqE5xoxLVxLjAcfGR/hdNGR1T8Eyq3X+q6oLDogXnsYM6SaI2
 tmN5sPjrcHPE4djeafWmiF2PqnPdq3ICsqnFyWSaD2CU53d5iEFce4TLSQ7omBdNWCPAEXqCuTH
 eygs8eQbLTZXL/WVOvdOp72xCQg2SCgPDMz3q+lciKXC0SNUWDZ/YlT2cI64FTnxbs/vMdTTBA2
 6rApHacZ122Mp0ViMmN2F40FzSoJn43R7mB9ZxZOXgJi8xlgL2eW277p3hRrnywGNeG0/7JSUvx
 oLjSuWH+KAfWEnxKYRnWNp4ClIXIvzTlbVa6oWylF1+2Ian0s8cZixXB44R/gfyCpkZygNB2VRY
 EdXKTBTT3fSNJeL8YYnOBK5nZJt30s8M1qW2+Xy9gaVqr4wNQ0dvSFfU8vfD7IgJLLjwqu+8ZV1
 m3qhFYqdzzFzmzJpa8g==
X-Authority-Analysis: v=2.4 cv=YcawJgRf c=1 sm=1 tr=0 ts=69ccf5dd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=F5tj5QwVYdw-9oKD5zgA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 6nqM7wvTf_GLkh7QJiLhtGe4DuPQwqFh
X-Proofpoint-ORIG-GUID: 6nqM7wvTf_GLkh7QJiLhtGe4DuPQwqFh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010097
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-101306-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E6754378DBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/2026 7:53 PM, Dmitry Baryshkov wrote:
>>> - Is the pin defined in the schema?
>> schema define property 'swctrl-gpios' with description
>> "GPIO line indicating the state of the clock supply to the BT module"
>>
>>> - Is the pin wired in the hardware?
>> pin SW_CTRL is wired in hardware.
> Granted your three answers, it can and should be described in the DT.
> 
>> i have below confusions about 'swctrl-gpios' of 'qcom,wcn7850-pmu'
>> which WCN7850 pin is 'swctrl-gpios' mean for ?
>> Why to introduce 'swctrl-gpios' ?
>> what problem does it solve ?
>> how to solve the problem ?
> Please descibe the hardware in the DT. Problem solving belongs to the
> driver.

sorry for not agreeing with your points here.

it is better to correct or remove 'swctrl-gpios' within DT binding spec at least
for 'qcom,wcn7850-pmu' with below reasons:

1) provided that 'swctrl-gpios' is for pin SW_CTRL of datasheet, binding spec's
   both description and its expected usage are wrong.
2) its driver does not parse and use the property 'swctrl-gpios', moreover, the
   property have no user within upstream DT tree.
3) the property is not mandatory based on binding spec.
4) upstream DT tree have had many such usages as mine which just set default pin
   configuration and not specify 'swctrl-gpios' explicitly.
5) kaanapali-mtp is originally preinstalled with android OS which supports some
   qualcomm specific feature which have not been supported by up-stream kernel.
   so kaanapali-mtp H/W has some wired pins which is not used by up-stream 
   kernel sometimes

