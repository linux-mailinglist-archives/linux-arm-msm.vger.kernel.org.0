Return-Path: <linux-arm-msm+bounces-59918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D36DAC93C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 18:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F290F7A6809
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 16:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8A91D7E26;
	Fri, 30 May 2025 16:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SYDzNE7+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBD21CAA85
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 16:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748623329; cv=none; b=BtLrnf/K0c/4azmhO6RB5qgh3tFRpm0AY00WfzKRo2okQCh9WnF8lVcUBPXcg31Xxuo5/t4IUcftsgheH0hfSpHbFtBR4hJPhGfQq/FhhwyT9XVjGniX6K8IzsWEfWpA9qzNLsp8otsbdZAeVhGVXmMAzgg1YhlYnpFOGwNpZ7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748623329; c=relaxed/simple;
	bh=k0r3jAdN0yq9usoh2WWpT1HcqWj23B9/RTpZqizK8xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ViNOvELIsxs+gijW+8HjjCyUu5xP5MgJ1iHC8/5sax5Ig1jhX1Z5QONj4Z2lWbP3nVzXtbmgG3sJd5WOuJd0+lMCJDv5466fnuK5ldQKZrLGTWI/j7XPiK56eZ3g2/4oxYJkIAqmHEsge9HVFNHnmxKNK62ieMtXRRbXECh9rNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SYDzNE7+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UArLoH013717
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 16:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dR7iDYHwxHQyVpZ0FR3nn7vovmsedDiyUz4cLKOAiXY=; b=SYDzNE7+O0bygCAE
	rlaLgorWaRZG5WEOWvfqnQUOYdEJO1GuvfPt9Hb91QRcE3DT1eUSvfAKAhSqNES1
	Qoou5l0Ji/ilQW4ccGpSqXFA8cGDsT6KmPwILCDbgVSyNI+skgZKvdR3f7BT+U+Q
	2+VaRzZ9qp9aEA7/KDG6fFisGYzyorWjZ0RGb1IhbRIehf+lcRAwvkcvSHYfF2cv
	8cikVvzVsf/LRiAAGUs9y7E/eVcdWe6fRAiPA8kPM3d+luxFOsY5BtFKBwz5QZZP
	BcV/lZKLJY9TqZW9q0WSVsvk7HqkrjdNiy3XVuAW3ADhOoWe/MBq8Afw0irEnyFx
	r/hmCQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavm3qsq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 16:42:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5d608e703so390012385a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 09:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748623325; x=1749228125;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dR7iDYHwxHQyVpZ0FR3nn7vovmsedDiyUz4cLKOAiXY=;
        b=ZehpcykI4h7ocqTR92IPzwfTGseB05LaWXvutbH6b1ani+MSsQxBB49FBd/gGF+ZNs
         r/4ERM0jZ7xp0A42c+2GCyPDtD/3PjdkEmaJ6WxBc9ych2T1Ypy2iDzBvV6j0OBtTrV9
         qnyoQwOwD7DcOR9C4vq1qC1XQeYNFl3DrPCxJZX0EgvdrMvAh3F0JHm3eFrdpP84Li8l
         EcC/n/yRldjJrxiCI0s0sNYZnbNNUbet8SYjEU5uZ5AxxtkK9+SiTDr6g/JSyWj03hFk
         3FwMOoCNVUhQwLRLdIakUwJG6T5+PBR689LQUreAuYn2RjIxK6XnSXjCM6HQsbvqBwe+
         pLSw==
X-Forwarded-Encrypted: i=1; AJvYcCXHPJ/rOjWbrsYU5yqKHlyxNW/Vu9l68O8hihCGbMn6lDKPioYzkfQRCp1sOTozs0yhu2LICW7T5OMwy8mp@vger.kernel.org
X-Gm-Message-State: AOJu0YyFupcswiIfdGRl3yX3I2s6731MPgqNQertNHYVLfn8Zx/J0Q5/
	jTI4hxnBw8Rh4E16zvC73j7UH7oObVjJnvWqQweMjtWRo0M9CMgNGiW2Rhb9oWH9q3IW7A09CDC
	R8o1MWVvmya0FYk6gHeTeGDDVeEWW2TuXlhUhloZ1rK7Y+9srA8zs1H4cg9aKP8eN1VeL
X-Gm-Gg: ASbGncvbvo9Yoo9dvP1qkRoPDOWl8vhIm39UP5duCYbvHYNSm4raZC3UYgFbOuMWPHR
	oFG6dRW/f3B10iQecn4arW+PJePr5ysQn56sIBmJYY647nugar4A7xeLtem1Sm6QcncWP7SwtS1
	sGZNkwL1CUIoxMbL7N6LWJpRqausrGXCFvzK2hmKCQdNDx2E7Z4wzOwNLAjqeoP5YwER/RXodcx
	23w1T3pU+sbw9Y5yRLSbBXcWPaiX0eppjCqyqbQbXB9aAOEvkRuXo7DHSNw2seC1YipOng2cfKV
	6JPRn/z7sAE7TuN8zn6NajuNMyMD1Ey/MxIwnqRZguT8MoUrzQAKBr6bmKQke28N3h05B8kHr3U
	=
X-Received: by 2002:a05:620a:40d4:b0:7c0:b523:e1b6 with SMTP id af79cd13be357-7d0a49e7ba2mr373935585a.11.1748623325395;
        Fri, 30 May 2025 09:42:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmLJH2eYXh48Y1EMT6w54qghRK+Ixc8oH91zfHpViI5rEh5CCU1ZanUtnkUIi0JSYuzlqzYg==
X-Received: by 2002:a05:620a:40d4:b0:7c0:b523:e1b6 with SMTP id af79cd13be357-7d0a49e7ba2mr373932285a.11.1748623324980;
        Fri, 30 May 2025 09:42:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85bd2e1dsm6556581fa.100.2025.05.30.09.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:42:04 -0700 (PDT)
Date: Fri, 30 May 2025 19:42:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v6 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
Message-ID: <644oygj43z2um42tmmldp3feemgzrdoirzfw7pu27k4zi76bwg@wfxbtgqqgh4p>
References: <20250506111844.1726-1-quic_jseerapu@quicinc.com>
 <20250506111844.1726-3-quic_jseerapu@quicinc.com>
 <qizkfszruwcny7f3g3i7cjst342s6ma62k5sgc6pg6yfoti7b3@fo2ssj7jvff2>
 <3aa92123-e43e-4bf5-917a-2db6f1516671@quicinc.com>
 <a98f0f1a-d814-4c6a-9235-918091399e4b@oss.qualcomm.com>
 <ba7559c8-36b6-4628-8fc4-26121f00abd5@quicinc.com>
 <w6epbao7dwwx65crst6md4uxi3iivkcj55mhr2ko3z5olezhdl@ffam3xif6tmh>
 <5ed77f6d-14d7-4b62-9505-ab988fa43bf2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ed77f6d-14d7-4b62-9505-ab988fa43bf2@quicinc.com>
X-Proofpoint-GUID: Q9xXKSXcmUiJj8y8Amylx2gUjxhBDbiK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE0NyBTYWx0ZWRfX1TxTdMzsKZTd
 dLPuqS/uHeh0Jog5m8oBf6OANMAB6BD+MRpztSsa7tkJtrZHojSdQYK8XOH1ftovC8KF1W/H7+4
 Sv6cWgTI+Mm3HWIB092Y4cWENVJxC/9sMiXvDWcJNe7KkrsCFzmG3KPe5bMTjB7w0G6DqGxzdYX
 xhKeK4ku2slt1yzUwOc/L5AlZ2pHrEIfU3wFLFCSc0uXvzztyF4KloN1utivMgGSjpOl63gIonk
 7aO+6GE8EyRucygYSQBCb66rU7gVdtaARR6rEL5B0pdORJA3+2cdKgkx9VAxcNcX8m6MV203l/d
 FaP2fZ2qKq5wBOAiq+Ex95/PKMbP/+m5txFodjVAVcof1LSezyeGYWAh0TY8v5xEh3g2Hz353Ai
 kuyvRnMxKXPJyrnlJRGfLYJQqXgMBIb/KfQRznusQ6E0qHpX+86fThWLG1NEdlwlGU702LLM
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6839dfde cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=dt9VzEwgFbYA:10 a=hMb-uB02kSkghMJ30ZAA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Q9xXKSXcmUiJj8y8Amylx2gUjxhBDbiK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300147

On Fri, May 30, 2025 at 07:36:05PM +0530, Jyothi Kumar Seerapu wrote:
> 
> 
> On 5/21/2025 6:15 PM, Dmitry Baryshkov wrote:
> > On Wed, May 21, 2025 at 03:58:48PM +0530, Jyothi Kumar Seerapu wrote:
> > > 
> > > 
> > > On 5/9/2025 9:31 PM, Dmitry Baryshkov wrote:
> > > > On 09/05/2025 09:18, Jyothi Kumar Seerapu wrote:
> > > > > Hi Dimitry, Thanks for providing the review comments.
> > > > > 
> > > > > On 5/6/2025 5:16 PM, Dmitry Baryshkov wrote:
> > > > > > On Tue, May 06, 2025 at 04:48:44PM +0530, Jyothi Kumar Seerapu wrote:
> > > > > > > The I2C driver gets an interrupt upon transfer completion.
> > > > > > > When handling multiple messages in a single transfer, this
> > > > > > > results in N interrupts for N messages, leading to significant
> > > > > > > software interrupt latency.
> > > > > > > 
> > > > > > > To mitigate this latency, utilize Block Event Interrupt (BEI)
> > > > > > > mechanism. Enabling BEI instructs the hardware to prevent interrupt
> > > > > > > generation and BEI is disabled when an interrupt is necessary.
> > > > > > > 
> > > > > > > Large I2C transfer can be divided into chunks of 8 messages internally.
> > > > > > > Interrupts are not expected for the first 7 message completions, only
> > > > > > > the last message triggers an interrupt, indicating the completion of
> > > > > > > 8 messages. This BEI mechanism enhances overall transfer efficiency.
> > > > > > 
> > > > > > Why do you need this complexity? Is it possible to set the
> > > > > > DMA_PREP_INTERRUPT flag on the last message in the transfer?
> > > > > 
> > > > > If i undertsand correctly, the suggestion is to get the single
> > > > > intetrrupt for last i2c message only.
> > > > > 
> > > > > But With this approach, we can't handle large number of i2c messages
> > > > > in the transfer.
> > > > > 
> > > > > In GPI driver, number of max TREs support is harcoded to 64 (#define
> > > > > CHAN_TRES   64) and for I2C message, we need Config TRE, GO TRE and
> > > > > DMA TREs. So, the avilable TREs are not sufficient to handle all the
> > > > > N messages.
> > > > 
> > > > It sounds like a DMA driver issue. In other words, the DMA driver can
> > > > know that it must issue an interrupt before exausting 64 TREs in order
> > > > to
> > > > 
> > > > > 
> > > > > Here, the plan is to queue i2c messages (QCOM_I2C_GPI_MAX_NUM_MSGS
> > > > > or 'num' incase for less messsages), process and unmap/free upon the
> > > > > interrupt based on QCOM_I2C_GPI_NUM_MSGS_PER_IRQ.
> > > > 
> > > > Why? This is some random value which has no connection with CHAN_TREs.
> > > > Also, what if one of the platforms get a 'liter' GPI which supports less
> > > > TREs in a single run? Or a super-premium platform which can use 256
> > > > TREs? Please don't workaround issues from one driver in another one.
> > > 
> > > We are trying to utilize the existing CHAN_TRES mentioned in the GPI driver.
> > > With the following approach, the GPI hardware can process N number of I2C
> > > messages, thereby improving throughput and transfer efficiency.
> > > 
> > > The main design consideration for using the block event interrupt is as
> > > follows:
> > > 
> > > Allow the hardware to process the TREs (I2C messages), while the software
> > > concurrently prepares the next set of TREs to be submitted to the hardware.
> > > Once the TREs are processed, they can be freed, enabling the software to
> > > queue new TREs. This approach enhances overall optimization.
> > > 
> > > Please let me know if you have any questions, concerns, or suggestions.
> > 
> > The question was why do you limit that to QCOM_I2C_GPI_NUM_MSGS_PER_IRQ.
> > What is the reason for that limit, etc. If you think about it, The GENI
> > / I2C doesn't impose any limit on the number of messages processed in
> > one go (if I understand it correctly). Instead the limit comes from the
> > GPI DMA driver. As such, please don't add extra 'handling' to the I2C
> > driver. Make GPI DMA driver responsible for saying 'no more for now',
> > then I2C driver can setup add an interrupt flag and proceed with
> > submitting next messages, etc.
> > 
> 
> For I2C messages, we need to prepare TREs for Config, Go and DMAs. However,
> if a large number of I2C messages are submitted then may may run out of
> memory for serving the TREs. The GPI channel supports a maximum of 64 TREs,
> which is insufficient to serve 32 or even 16 I2C messages concurrently,
> given the multiple TREs required per message.
> 
> To address this limitation, a strategy has been implemented to manage how
> many messages can be queued and how memory is recycled. The constant
> QCOM_I2C_GPI_MAX_NUM_MSGS is set to 16, defining the upper limit of
> messages that can be queued at once. Additionally,
> QCOM_I2C_GPI_NUM_MSGS_PER_IRQ is set to 8, meaning that
> half of the queued messages are expected to be freed or deallocated per
> interrupt.
> This approach ensures that the driver can efficiently manage TRE resources
> and continue queuing new I2C messages without exhausting memory.
> > I really don't see a reason for additional complicated handling in the
> > geni driver that you've implemented. Maybe I misunderstand something. In
> > such a case it usually means that you have to explain the design in the
> > commit message / in-code comments.
> > 
> 
> 
> The I2C Geni driver is designed to prepare and submit descriptors to the GPI
> driver one message at a time.
> As a result, the GPI driver does not have visibility into the current
> message index or the total number of I2C messages in a transfer. This lack
> of context makes it challenging to determine when to set the block event
> interrupt, which is typically used to signal the completion of a batch of
> messages.
> 
> So, the responsibility for deciding when to set the BEI should lie with the
> I2C driver.
> 
> If this approach is acceptable, I will proceed with updating the relevant
> details in the commit message.
> 
> Please let me know if you have any concerns or suggestions.

- Make gpi_prep_slave_sg() return NULL if flags don't have
  DMA_PREP_INTERRUPT flag and there are no 3 empty TREs for the
  interrupt-enabled transfer.

- If I2C driver gets NULL from dmaengine_prep_slave_single(), retry
  again, adding DMA_PREP_INTERRUPT. Make sure that the last one always
  gets DMA_PREP_INTERRUPT.

- In geni_i2c_gpi_xfer() split the loop to submit messages until you
  can, then call wait_for_completion_timeout() and then
  geni_i2c_gpi_unmap() for submitted messages, then continue with a new
  portion of messages.

-- 
With best wishes
Dmitry

