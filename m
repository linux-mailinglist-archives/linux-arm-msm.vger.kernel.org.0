Return-Path: <linux-arm-msm+bounces-101317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BnqCVkBzWlNZQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:28:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACA13796AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EE4D030714E7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 11:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D5F38B157;
	Wed,  1 Apr 2026 11:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CyIQ7E7u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H5OOX2E8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418CB377009
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 11:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775041700; cv=none; b=HHbUbaNqttufBbjaiKiqd9znm3S4lcMaBj0+kAgqf92fNiObWHIx7RIIOUj9RHxmPenAHZMrDAV9V81ijBhUcD3Cmh83Z+qj0CbHpNN3cMR+VxF/7cYpU9Eg2jq7EH8LLcm+GVzNSM9oDizI/worZCGaJkk2vtk3w60QWQcOdzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775041700; c=relaxed/simple;
	bh=skBxgxc7ZOCskwocphWCljGZIqgSS9Q8DkJp51mrFtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWa9eK0I6CqWsx0/YGv90udtCP9teoMMiPfFUGQ9ETMH2w5dFUuHYhM03Umj7D17AxWW+H/Lj13yJj1o4s47CLfrGQ9MQ/Pmqs/2ylgHOfmHSMO3S/fwzLI3BnF+6685QbAtuXSRNp78GOmQVqMZsbFsp4lOdH5dqGKkoo8YvC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CyIQ7E7u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H5OOX2E8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317CcGF3103857
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 11:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hF2S+cZKRhO63MC9LXFCN9AF
	XGXnC3jnyECgrGilXyU=; b=CyIQ7E7uDajLl5DzAwEoIrP2+4kGkJTnfJ27inUw
	cRJD+kKe7usyxetJ3hO+/GSKJjtBiK4WdGhzJIEAFWvtcYQ5AhZ5lOv/6psWkqJQ
	UQntPJWBTLlr78qdSFndPXfqqpQSZH/cPC1aqc+3nbStzA8VBuHXh7pnRBT32OFM
	NcjOUgH7gOYlPnSsbp0XJL5fku6GdPRbVer37gyBY//DNcg3O3n2Slv/9z4ShjOL
	PZ6y5wtRlpDEi36A0eTiejmaFoq2/M1UWgFb+F/G6ki1SdixJFl2eMkIpBJYGxDi
	n8STnRgP10hImay2s8nNUUxZO6mneZyCFaJlW3QXffRZgw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js240gr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 11:08:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b2cbe7223so216782531cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 04:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775041697; x=1775646497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hF2S+cZKRhO63MC9LXFCN9AFXGXnC3jnyECgrGilXyU=;
        b=H5OOX2E8UkDGCAaqqkgGLhLFlg24J39euEA+RQJ6dGao8pthhXKq3oOVTTEoWI8HiY
         Yr7n2pDobOf8VUczlLRZrBGTus3zEp/87OEl+rlHGbLn8B5Ui6kf1BafBeDS+YWYR+M2
         C8faKUF3gNOy77FEShIweimUNxkM1pEMXIuUfrVmfuar3Tg2EWt4mat09n1U6VudHMY1
         JuuZ0eEFy4PXqUKGjEXRsGy2H5ZsOai6x4OGa8cG4YgxSfRiyvRxKix1qOhRVjN994PX
         /vXUXOO8WPfIT5QIl5mCWrd748HqIufsjA9tkf5o7sVnG1A2jmop9AQy4N6/WltUI7sC
         RisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775041697; x=1775646497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hF2S+cZKRhO63MC9LXFCN9AFXGXnC3jnyECgrGilXyU=;
        b=pF3fP0yn9MM8ThSXq9m+BATlWGjttCQVFBymC7zWM5acK3eFjXHld+XTfcOBrt/T8D
         UDEAGcieDlUIkB/lakx4hXeyOnndLi39vMdqWbu5QiqlUJZBD1/a6hBEJRBFuuATcZaj
         mfnYJvK/BOKxfzIiS2NfhTuf66l6VsbmVZJWvdbgaxdcvgN/K2hORofR5N/N5dDCNCBZ
         EARs4u0YanpuETwfZAi0qi4wcGFkmQDCmMTDCmP4KaxEaMeZnM0rLQNVSjCy7KG6CB50
         bhEHPtJoIeZOuH7RRI81O/TjxIthvb304YLdacw5Qvx+lTN74spWONLlXpQREtWVg4Kh
         D9dg==
X-Forwarded-Encrypted: i=1; AJvYcCXTQ0L7ciSqMooMg5TzAZyR1KEBRWL3P8OgiCzjHS6xs5tujy7LV4ZXr0LaoK+YbJgKPWBS7D/7+P0qSddL@vger.kernel.org
X-Gm-Message-State: AOJu0YxaaKCwYA0xtX1krVa6YHBn592rfpWmRMkV0ykZZQ+J8JC0GTsg
	lq0EZZX9hQZUazL2dGCrZ1zO1Huk+ES96sGiwW8uctRIJgf7VlYLXpCcddMI+vTFk/Wq++Gdddy
	6jDZrwR6COZjBgaEbT9qJxN1wbfx2IbSO3oSgCHBYRKjzYDBqSrpO95DHPkdeUjvlIYOL
X-Gm-Gg: ATEYQzyhcOd236LljhqQ69uVW+30Afeabm1n0hKrfptOTPyunUlbuBbkWtR8d7x+7+K
	9iTI9UfA14HhlG1l3PeT/lhxzIEyF/DsT0rlX9Bl3YgswWf7nYB2DtsrkLgaTNdrZbUwmJI/UG5
	4CNhUC8NSLlfnh4SkCSuGF1+iwR9R1mBywFL3UsDqREPI12AqU6q6TUcJwA5oZSaDKZLpbaw6wh
	r0UpWUYaoNOWPLMw7ZoVhvFGxNbX2IueQuqhYfVg/5an4wo5UEBWY9yMvoovmkbYJZ+8Tl7G7gn
	96JFZ8uO1h7C3HeUqzQlGaTY7DcvrpNT1HPlQWv9jYWg1ZPAu06qKG67vpQnVwWXS41L/rImp64
	0qNSG6fcw0JcbQDMAuAZ+kuuCXl1T+HlNOWQB3b7/q45ySLzqfJqrJ2q0tM/6/NoFGsxF5uov+r
	Cv93GYPjyGX7nZQl3I/NORgfBPjWe4nndlup4=
X-Received: by 2002:a05:622a:5c8c:b0:509:37d5:7a41 with SMTP id d75a77b69052e-50d3bdb0bd6mr38901821cf.63.1775041697591;
        Wed, 01 Apr 2026 04:08:17 -0700 (PDT)
X-Received: by 2002:a05:622a:5c8c:b0:509:37d5:7a41 with SMTP id d75a77b69052e-50d3bdb0bd6mr38901441cf.63.1775041697145;
        Wed, 01 Apr 2026 04:08:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1444c93sm3334510e87.39.2026.04.01.04.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:08:14 -0700 (PDT)
Date: Wed, 1 Apr 2026 14:08:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
Subject: Re: [PATCH 4/6] arm64: dts: qcom: kaanapali-mtp: Enable bluetooth
 and Wifi
Message-ID: <vxps2mbj572en5yjickrfdeebdjmk33olxdw6qd7vpfsye4x2d@xrgbjahhgdrz>
References: <b5ogt5phzzifh45zyvzbressexgp4se5m7vvgmvaf3ed723hww@qovynwnps455>
 <13745334-c2dd-4a97-90de-a5ee18cff6a7@oss.qualcomm.com>
 <hyy65v74scdekci3kdowxdcujbmoeyx3vxv6dahvif6rzhloxi@rirggsitayqv>
 <ee38eaeb-d408-4228-b7a8-bc2d6e4ef056@oss.qualcomm.com>
 <c46islnlfzdawtw4o3holunf2a6rvfs7h5dznaggzptatdlqc6@7pjbwcqdtccl>
 <0279f334-95ed-4df8-9e42-749fd854c551@oss.qualcomm.com>
 <3xb6ya4zxhmaode3u3al5r4g3rfzlq2ifbyodvwtr3qgt34pwc@ia2xqfaeufd2>
 <ed5a18f8-04f9-4c4f-b4a8-9fc2a277ac40@oss.qualcomm.com>
 <ohg7jn4lozqw3lhwmhpx7qyiuw2pmjl7zwv6cbbjmbr2vnnw2e@qz6wbrjynbta>
 <bf1df5d9-787c-40e9-93db-536612982427@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf1df5d9-787c-40e9-93db-536612982427@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: R7iBQO0Sc_3yeuku7wkJWZGDr6WlkzR2
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69ccfca2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=o2mePYabdwgscwI317MA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwMiBTYWx0ZWRfX2zsRygijHail
 c7n95uhG1/lDsjsg3rgm1U5v/IaDNBu+fOG9cEVXupmpnEgF7N/NYOQVnWVUZS/9clwK1sVC24w
 RZwjz7BtYlPMleMaFTF+jbcZagxw8ZKtbHRRokI5zAJrw6ZgnPzWpdNdjKXKD4uyH03UDnSr1Js
 sSgth5woDTI1n/ORiuafWWsj3B0tBSjLqTUUVe2CHA1tUPonn35RR97+ykKWOlzeTRFp8MW9q+o
 8hbqHRBkuro2VnQ2Uq73rQtP3cUWU6Z3rTETqJwGxZnYQ3mZJdmA71mvMkRH0EFIKMwXT9X4Y3Y
 C6NgsB4J9JuKM3BP39uOOjD0tqeK+aZrTLBH5JuXYBVPYByZzzA0WBpG7uYxu/fPAl5qH8QPiHU
 4r3pv9lJT6qfrEI+ubk6tCW4c9M3t3IxxfPhtso1oYKBBMEEH3LzfwIa0Jtpx/vhCh4HEKxqQ5m
 E49TXOGW1nE+k9dbysw==
X-Proofpoint-GUID: R7iBQO0Sc_3yeuku7wkJWZGDr6WlkzR2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010102
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101317-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2ACA13796AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 06:39:19PM +0800, Zijun Hu wrote:
> On 3/30/2026 7:53 PM, Dmitry Baryshkov wrote:
> >>> - Is the pin defined in the schema?
> >> schema define property 'swctrl-gpios' with description
> >> "GPIO line indicating the state of the clock supply to the BT module"
> >>
> >>> - Is the pin wired in the hardware?
> >> pin SW_CTRL is wired in hardware.
> > Granted your three answers, it can and should be described in the DT.
> > 
> >> i have below confusions about 'swctrl-gpios' of 'qcom,wcn7850-pmu'
> >> which WCN7850 pin is 'swctrl-gpios' mean for ?
> >> Why to introduce 'swctrl-gpios' ?
> >> what problem does it solve ?
> >> how to solve the problem ?
> > Please descibe the hardware in the DT. Problem solving belongs to the
> > driver.
> 
> sorry for not agreeing with your points here.
> 
> it is better to correct or remove 'swctrl-gpios' within DT binding spec at least
> for 'qcom,wcn7850-pmu' with below reasons:
> 
> 1) provided that 'swctrl-gpios' is for pin SW_CTRL of datasheet, binding spec's
>    both description and its expected usage are wrong.

Please correct it.

> 2) its driver does not parse and use the property 'swctrl-gpios', moreover, the
>    property have no user within upstream DT tree.

There is no "driver" in the "DT bindings"

> 3) the property is not mandatory based on binding spec.

Which is expected, because on some platforms it might be not wired up
and on the other platforms the pin to which it is wired to might be
unknown (think about all the phones for which the community doesn't have
schematics).

> 4) upstream DT tree have had many such usages as mine which just set default pin
>    configuration and not specify 'swctrl-gpios' explicitly.

I don't understand this part.

> 5) kaanapali-mtp is originally preinstalled with android OS which supports some
>    qualcomm specific feature which have not been supported by up-stream kernel.
>    so kaanapali-mtp H/W has some wired pins which is not used by up-stream 
>    kernel sometimes

Again, what does that have to do with the hardware description?

-- 
With best wishes
Dmitry

