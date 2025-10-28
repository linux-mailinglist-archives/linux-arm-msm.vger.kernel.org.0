Return-Path: <linux-arm-msm+bounces-79205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 595D0C157C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 16:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 438E6464BC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 15:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE05B341678;
	Tue, 28 Oct 2025 15:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h06qaQll"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A87533DEFF
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 15:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761665446; cv=none; b=hb/zcBCv14ycP7U8EMHAdH/O2saxf9eijXTDjkiAtJ4vJkL+LatFBFrh5ci2YQgIFBJLTJRLb7bWmO6fNZ+pnaKHQgkyIn6gV7XiSzPSVOFndAVbIhLvlGPlTHjuQM92+8WMX3RsJLAI5qR0cL5eosJbgemuA7LTvCZ25GPMGGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761665446; c=relaxed/simple;
	bh=6UdoDHAGiXRiJ17qlm2HrguwWfFedEm2pbn/57l6ZMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UENAMuAheqpLxXN/gVsUYlyhG9xEnBox86u2F3xWFvLGOzG1cVI/2u5NjeH36BkAmHpck+7YxaJWVVdWc6EUX+EV4r8LTIQNQDXsWEoBPbWfvqrd5aeYUI+Te2KBZCXsOgjly61X44eyoJ4UfRKJFgE7CmutxkzQWsRXCCQirYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h06qaQll; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SEoIXK1916446
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 15:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pG8GKW3HfZTiiq9kKHjMnUDi
	5ZdEQ727ySpcizk4eG0=; b=h06qaQllr4bKn546rCuCVciUE5BKlH7U4SHq+A9H
	uDKhP81sgOm+G7hiMkdB5bvQore9MHc8tH75UZ5ipbXZIaTnSb/UkqV5gjXKccLh
	qS7oOYiaLAnswuhhFItjDKps7r8uEx1TDdlfiDtfVjndK1C6iRnLVbs3hVSJCf1k
	7ISiekn/Hqge6ZqWlt8jOI2Hc14QusNYBnDKzJ8Lwqn7bitdFCCjramSye9avwcI
	yLsRwkspyNYeO8eY08dnwlykWdv3I6tsVGW8xrxmUsUU+pldTH1z3RV9xBqMW51c
	9+8lhxF9kNkKMejRRqSR1OJbJw+gf3ZO6jgaZk5qn8W31w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2g2ftxsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 15:30:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4eba1cea10dso188589341cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 08:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761665443; x=1762270243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pG8GKW3HfZTiiq9kKHjMnUDi5ZdEQ727ySpcizk4eG0=;
        b=eU5bbUF9YSB8JWgyKxNUfh6phivAPm8CfZzArn//QAi6mrR0BlT7ri8xJweT31nGc+
         UeX37C6CJuUI27H1VarB6psu6T6SyG9CIf7Tz+eaXUX9gtA4j3sHB2iQYnc3m14Wd4vQ
         9XINhZv90MtAmeu6rNIWbzxleFPLWN22entAKXFBU/I3YKiRg1pFqryuDFKt7gAcQbFJ
         hZnujTwgIIEqze9ULXTf9WJxQbLULafGENaXfnbfc+/WH+kMEgQ8stTW2ZmoCtLQP0vL
         IWzufQWEE6qQ8oB1PuCR2t45kBXyxzZmkUJazWdE+opBgB42jhZStqVzk6o4K4hvP8M2
         jedQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7bSFgciz2OweXdazovgxOOMKkxm3pxb6JsBg2J7AN86yh2dia71MUSmpbd1ZBicfKyB0AOHG2E0DlYMT2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc1421PC7+yS0M0Gxxnsjyf1coyb5SeXuQTgvlc9xDNzJ1U+jq
	5jdpb4FS7s9DvNG/UaO3aCp9k7nj2cjuJsnsiacKXK3gMI1CywvlP1go9wuOs93n4ji0oN8QwkM
	OCKxDz8qmQ9JBrzRwiiJIFUnuy22jaGeWmfBr/DQuQcrCiR6WUC2pNcVFkDK/DHrurp/S
X-Gm-Gg: ASbGncvAWZSD/cAGxYnBlIdz6BoT8FgVvZWTSc82yOOFaUxRy4e/CSiTuHA/lq84CQR
	paKn6U6R6mADp6+8dyBi08cgUwtco7hzmEJm1boIGVn7NFHfdng47hmV++2PFI+EgT6SMOhAjr3
	e3W7nxeS18Fya7sXhFxE2A1gg+I5p9cOvHCDbgnAcQL38uedwlN8TpX2j8bfb0AldGM7ptXU0AO
	D2KUT9tIkIlN/0G4pulQaxasBtJC3KbqlOLukzep/9bYhkROxhX8ifdRs8MejDEGfNaudnl5CNh
	DKwLnfI0Eqw+xwqERebgKVm5M9K1BYVVB72GIWBBlQTv8XZSJwXieOve5l3opA35nBeh3KW9LPn
	5A2vH1s1nKxq113nU6k2j26E0zDBaevVXd4gPqQbO5g3jx5wTWpKSprpjAnyVkofrFm0JZuUPFo
	r7St2exqaI8FW0
X-Received: by 2002:a05:622a:40a:b0:4eb:779d:e8a6 with SMTP id d75a77b69052e-4ed07675524mr59981351cf.77.1761665443235;
        Tue, 28 Oct 2025 08:30:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEe3rwV3Bj/ayumOhQ55IcihIE7syNSfSWRZZUZGLZY8iz/NY9dnGezaGOf1Kquhk/VAmsHrA==
X-Received: by 2002:a05:622a:40a:b0:4eb:779d:e8a6 with SMTP id d75a77b69052e-4ed07675524mr59980681cf.77.1761665442708;
        Tue, 28 Oct 2025 08:30:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f68e9fsm3155404e87.71.2025.10.28.08.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:30:42 -0700 (PDT)
Date: Tue, 28 Oct 2025 17:30:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Skip setting orientation for UCSI
 version 2.0 and above
Message-ID: <xboq73zw752odclybviqnl75pp2nl2eamdvcdv2idqljck7qvu@zdh6ny7nja3w>
References: <20251028-ucsi-glink-skip-orientation-for-ucsi-v2-v1-1-93e936ac59b4@linaro.org>
 <a4f3yhhz5sntno6gnfbjnjjsbtyo2e4y3da2aywsg36gvxkaxg@vw2vryukrepl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4f3yhhz5sntno6gnfbjnjjsbtyo2e4y3da2aywsg36gvxkaxg@vw2vryukrepl>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDEzMCBTYWx0ZWRfX3jCyUYRyrA/+
 +PO/7g4NFtsLR1zaBGoLl/JJdFDGfrmWOIjVvTiRICQadxzUJty9GUrtYh0kDAPFUPLIbD+ryty
 6JBwb7yNZLD7iJyLOfil8cG9yGN27I3wcAZml4KPHzUxANy2YHb50wg2NFq1R4tKvBfpoVpCmfo
 UxIRqwcMkMazXuX10wKRiqzgMUWUNTWDHc2303o/JxZB9F9mdnJSrVxDAMWY9Jkuwrd1tX/dm54
 dewvu3QWM43UId71fMhT1ib0iaaY+wuQC2Hn0TTrb7ioLANnab1GApCekcQTqj4BEfiKHM5Z4Bo
 itY0tAMqfB8Zi2S3u3eDAfPs/ps0Jc+VCt6xr6+EYS8L3+gLySbODRFJtU3/yKwVNFLn7vclJ83
 DT7ms/Fsl2U+AmrJNr3bJQcgp7KUzw==
X-Proofpoint-ORIG-GUID: ScocbJldlqe3YT75lKMNLepTNufIYa2w
X-Proofpoint-GUID: ScocbJldlqe3YT75lKMNLepTNufIYa2w
X-Authority-Analysis: v=2.4 cv=FIMWBuos c=1 sm=1 tr=0 ts=6900e1a4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8
 a=ba_8BwYL3biiwLG8ZYsA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280130

On Tue, Oct 28, 2025 at 05:19:58PM +0200, Abel Vesa wrote:
> On 25-10-28 16:39:19, Abel Vesa wrote:
> > In case of UCSI version 2.0 and above, if the orientation is set from
> > glink as well, it will trigger the consumers along the graph (PHYs,
> > repeaters and so on) to reconfigure a second time. This might break
> > the consumer drivers which aren't currently implemented to drop the
> > second request of setting the same orientation.
> > 
> > So lets leave the orientation setting to the UCSI generic implementation
> > for all platform that implement UCSI spec 2.0 and above.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> 
> Ignore this one please, as it is incomplete.
> 
> We need to also set the orientation_aware in pmic_glink_ucsi_update_connector()
> if the ucsi version is at least 2.0.

Note, I think it should be set in the core rather than setting it in the
driver.

> 
> Will do and respin.

-- 
With best wishes
Dmitry

