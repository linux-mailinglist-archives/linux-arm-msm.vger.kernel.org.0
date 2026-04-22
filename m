Return-Path: <linux-arm-msm+bounces-104108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAtUJZy26GmgPAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:53:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C10444597A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:53:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D83FB3023DEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1253D0929;
	Wed, 22 Apr 2026 11:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtHnhO2o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JY4Kiebn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7283B27E2
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776858776; cv=none; b=BVW6UMZA4kYgKgrDED7WkKSkp+XhOYGpWhKP+deHYKyIH1C/s2ybbcbn3WjxOdzqoq94mc9IINsmXubs0XPAfyBBDdopd/L57wyxEYspq1FPBLfF0Dw5pAlqxl/6T0VMzHrgHltHoBPAMuqcCYpTvce3Ruh+fO8daVByA7IoJuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776858776; c=relaxed/simple;
	bh=op2NPRB2c2e74WNCpOsL0DG+SUdRvRWk2wWmkZJCF1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZSHKKUWOzvQYUkz/zv3qtrFKnEs2jutCSGQNTqtdoDPQMYpY/ymPitY4Rh2jrzw21SJozYpHVsM+DuAWxoCHiSAvHvKIbfUKoadtMMaROR8sxqzDKgUNy8tjM0G+FMXbPBwdsSfQVh3mUFWRZznocvEzdtbRDZ74gEsQPS0ljdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtHnhO2o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JY4Kiebn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M99FxG647553
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RedL6ESsshJb8pVdNamFEEdb
	oFazoUv2pug37oGSMPY=; b=YtHnhO2oscHlpIBxmqpPpttQbMqVsxBV+kgg4Dvy
	0FJRMG4sMzNzic6KTR9chOz48THLGC072G88gbb9KMPHxua6p4OQKUuoMyymn5Se
	ymRo1SnTZCx0ghOQwa5sjkjjJoRff8ZFtlnu4B2YkpuSXDEEqFBniY8UHDUhnZf7
	vjQgIGGcjd6x5zYU57c88CZ8DeOdUNd63WjM6tGEm5LnXsu8t7iZM+GYgB1odowZ
	qchXZ4oHc7inbxLasgCwEdoiKR2xXKtCuFKWc/PWRJgOXuPw4eqGkyBgwTeXD1kB
	86gn7sElbGOCG3PeV8nuPwxRToMXW+yBJsa3/7TXFO4/hQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenkb5h0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:52:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4b81c632so122973861cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 04:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776858773; x=1777463573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RedL6ESsshJb8pVdNamFEEdboFazoUv2pug37oGSMPY=;
        b=JY4KiebnvRDV549XrUG5f0s/DHWL8IkLO7QhFBmEMJdnERep5SruUU5vrkuDUrKg6D
         zm4AD0pBwVgx2eFk7kaVb7qXQb9l5jjhKj4ReiebE/uPnPk5jtNfwCzbBdSB5yFNcTuF
         +67xxA0I15M78She6VxvV6Z7iwwxsnNGbf2o2/hN4wZqqHlZxkg5g4hB6CSEtAijUTht
         LNN3Idn/1R5px9xMSFVjxic+x3nAqXZ7fyQA2jys7lM6rtc4FbNkyXEMyN0Bl3I3PGN+
         Bt3yTgApcw+id6+WHKo2VWN3bsFNXOY8tiyHlHjvsFDg1ihxHTxfEtDZFTUUgq840do1
         wwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776858773; x=1777463573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RedL6ESsshJb8pVdNamFEEdboFazoUv2pug37oGSMPY=;
        b=r6ArmwHf2WDqu3rnbqt7hKzaisKKxLsmh84Mo3G9vPsVx2c3XQr9yoSBpXYLzveVkK
         OrEmDSbob00Hg7g8nKYvl7t+DMyy2UzpwcSklKOjFdOFOZcAsK5JZxcu3NWP7Tg/nGh5
         Ir+xxXN/Ai1H2Km0qG4ywwWlDJcexrVLLM95AJp/TahpbvIdyay6Kal0mITUHXjP0gAc
         UwqZ0x1uigPbVgsUg5fkikDXbEukcEfkxvGR4AyRNC7V9xuQ8Oo9mKr/v7Gnsfu09jMN
         oWLHZ97qvGoVhRwhZLEkp5Zs8K1IsGy3F0tkoB0JqwYtwVPoOs/R6FNRG4UPBpsX3liN
         itpQ==
X-Forwarded-Encrypted: i=1; AFNElJ8m7BeR8Eu8dxdbrN5f8dkgtx7saeSV4hTGuaymujcV961puccbsB7AarhVr3r4MPXf+8MEQySdjyDgjlrM@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg9lWOJF9MlpA3mnOE3pWJUg6WIWNgL4XuIa0a3um3cK4udKj8
	W696dOv14fCJ44KsYcLLl7hafBSs48nNNIevvJie1JrB6tMwWp1w/DkdJb+OaVsYoxdscrgvSS5
	FZ7SjCi0lCg45aaEYhLe74xew+D0Z+kbZ+qKtkOq/cqRwQuyBasMnMLtkU6uwf1ZdKXAr
X-Gm-Gg: AeBDiesQTY+9rRQSr3SBLnmTMlT/g7D9cfo+E2SboDzmie8aUg+4X1jMoC+M5DdeEsU
	L49eUlMBWxDNXfkB1l2r3q/xzR7sYkCfPpiuHsdTkTFvNcthkZD15ySSVTzDP1VAOcMDMREzMZE
	gw14RP9y/LLjsAzsmhzIipDXvYtA6Io6qhjQtngolHOcN7vObh8OA1maSns5CId78GuFXYgq3WZ
	MpeXKbrvn/VfzTkto6M+Yipkt9jrezu3DhI7sKQV5NK0y/UP+fKw64o9ylEGzFdjfvw/glfWBoY
	aYzHjed0RUbGK9xVUX7B5W0dHecJF96fx6j8OhDYI3c016tsVtfVUyZ7mayeGhVdcBmq+eQI1YR
	8l3dwXj2u+61XvtjWOX7tMAc/jeUb2GIE4vF4x2ZItA9taZwHMGAnIGaOmsklkmoL6XG+DwbYzG
	twJi3uze6+cOvnYy2+pFZOsk/bCdkP1fmkxBS1mMM237A0HQ==
X-Received: by 2002:a05:622a:1e9b:b0:50d:8c24:20f2 with SMTP id d75a77b69052e-50e36c124d0mr345309521cf.30.1776858773029;
        Wed, 22 Apr 2026 04:52:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1e9b:b0:50d:8c24:20f2 with SMTP id d75a77b69052e-50e36c124d0mr345309111cf.30.1776858772605;
        Wed, 22 Apr 2026 04:52:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e1106sm4391312e87.53.2026.04.22.04.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 04:52:51 -0700 (PDT)
Date: Wed, 22 Apr 2026 14:52:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Prashanth K <prashanth.k@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable retimer on USB0
 port
Message-ID: <hctf2vexnfd2lbnggvoanm424rmpzadg6daqq4477audy6mu2e@nwyp3ijbhay3>
References: <20260422093924.2976069-1-prashanth.k@oss.qualcomm.com>
 <6c2c5fd6-c032-4658-9a15-039c77074c4b@oss.qualcomm.com>
 <8cb5e28c-1c6e-450e-855b-32491ee73885@oss.qualcomm.com>
 <3d50f17c-060a-4a1d-b539-1bea9b3e6cd0@oss.qualcomm.com>
 <79926b02-a892-4e59-b794-e8534136fe07@oss.qualcomm.com>
 <efa2da27-79d3-4cbe-ba3c-2446c6252058@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efa2da27-79d3-4cbe-ba3c-2446c6252058@oss.qualcomm.com>
X-Proofpoint-GUID: faJVMmAC2nRDU-pP_Do_BLxie9qBpOab
X-Authority-Analysis: v=2.4 cv=SONykuvH c=1 sm=1 tr=0 ts=69e8b695 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=M998KXd_89pbYZ5RrLQA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: faJVMmAC2nRDU-pP_Do_BLxie9qBpOab
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDExNCBTYWx0ZWRfXw6tXqMaaLxX/
 o7ixeE55fNf/dliuY6l9VaHLAjhg8Ld+5TYD3Kp2WHLS6M17wy+j103RwYezIq4pdwV7kgLiCpD
 PJIHAWHn+a4l4wmnm75BCyFoNH9FSLMFhEEiVuKy8XnoWE4qWcbfucAfFCPap9CsvIbHMK0dzvG
 0jxL9nV3fPBDNK0sgyNnHLfKk7Cshc+vhBhdF5g3Tf6IECwjWN4RvidUzENWFuCP7ZNrIxVN9rX
 Ra1kcl7tF+Uc5GLdzZMYmkE+i/RSXzWpBQ12MCE9dxzvZGwCPNR9+neD/AUsEShD2nvoMKlo6BA
 2N5kSOV+O+aQetLFEuwF/RN6kMKP6W2/RlY6vfIEj1h0LCWcaf3QW304Es6LHkgGQ2avTTWdrvR
 RtAXrtgKPCzL0kWikO9qQwjz52WhEh2xQGQyXljf/lQkbb2z5ycUqJRm4CsnUNTtVpAYuWhMjm9
 aeJxO4MSEm0Z0lJ8Gkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220114
X-Spamd-Result: default: False [3.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-104108-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,0.0.0.2:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email,0.0.0.0:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.861];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C10444597A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 01:09:22PM +0200, Konrad Dybcio wrote:
> On 4/22/26 1:04 PM, Prashanth K wrote:
> > 
> > 
> > On 4/22/2026 4:13 PM, Konrad Dybcio wrote:
> >> On 4/22/26 12:32 PM, Prashanth K wrote:
> >>>
> >>>
> >>> On 4/22/2026 3:56 PM, Konrad Dybcio wrote:
> >>>> On 4/22/26 11:39 AM, Prashanth K wrote:
> >>>>> Add the retimer for usb_1_ss0 port (USB0), in order to enable
> >>>>> super-speed enumeration on that port.
> >>>>>
> >>>>> Fixes: c11645afb0e2 ("arm64: dts: qcom: Add base HAMOA-IOT-EVK board")
> >>>>> Cc: stable@vger.kernel.org
> >>>>
> >>>> This is a feature addition, not a fix
> >>>>
> >>>> [...]
> >>>>
> >>> Sure.
> >>>>> +		ports {
> >>>>> +			#address-cells = <1>;
> >>>>> +			#size-cells = <0>;
> >>>>> +
> >>>>> +			port@0 {
> >>>>> +				reg = <0>;
> >>>>> +
> >>>>> +				retimer_ss0_ss_out: endpoint {
> >>>>> +					remote-endpoint = <&pmic_glink_ss0_ss_in>;
> >>>>> +				};
> >>>>> +			};
> >>>>> +
> >>>>> +			port@1 {
> >>>>> +				reg = <1>;
> >>>>> +
> >>>>> +				retimer_ss0_ss_in: endpoint {
> >>>>> +					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
> >>>>> +				};
> >>>>> +			};
> >>>>> +
> >>>>
> >>>> Stray \n, but you should really have a @2 port here as well.
> >>>>
> >>>> Konrad
> >>> Can we ad port@2 and leave it empty?
> >>
> >> Why would you? Just connect it to port2 of the connector under pmic-glink
> >>
> >> Konrad
> > 
> > Because the port@2 of pmic-glink (pmic_glink_ss0_sbu) is already
> > connected to usb-1-ss0-sbu-mux (onn,fsusb42). This is different compared
> > to other connectors.
> 
> Are both the SBU mux and the Parade retimer present on board?
> 
> The former is redundant since the retimer already has a superset of its
> functionality, so that sounds rather odd.

fsusb42 might be also used to switch SBU lines for other purposes (e.g.
for the debug).

-- 
With best wishes
Dmitry

