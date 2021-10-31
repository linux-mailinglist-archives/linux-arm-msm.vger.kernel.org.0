Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E76C44115C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Nov 2021 00:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbhJaXPP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 Oct 2021 19:15:15 -0400
Received: from dvalin.narfation.org ([213.160.73.56]:38130 "EHLO
        dvalin.narfation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbhJaXPP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 Oct 2021 19:15:15 -0400
X-Greylist: delayed 321 seconds by postgrey-1.27 at vger.kernel.org; Sun, 31 Oct 2021 19:15:14 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
        s=20121; t=1635721637;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=hvfj/vbzXF8QjfGNJBTkHUiwzmJoeCapnbm5mqK9mNg=;
        b=kLONbe7U/gJYV+nXMcn7gCSX/tmv7Ard19ogIudDcdG8zo1bdhUbCau4OuP7bKhtb6/aU6
        PjRC0WLYTHOpIpLgaVKaJIQXxvdKwUzpoHfP5YHq3EA0cpN6ln+7P6pAdm8nEXjwtk6UtF
        mKxpowI8L5i+Mrhc7KK6L2VTy9FMyMQ=
From:   Sven Eckelmann <sven@narfation.org>
To:     "Ivan T. Ivanov" <iivanov@suse.de>,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-serial@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Subject: msm_serial: ipq4019: RX polling repeats up to 3 old input values
Date:   Mon, 01 Nov 2021 00:07:09 +0100
Message-ID: <4119639.d4o71su6xY@sven-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2589319.nCAbQjUXP7"; micalg="pgp-sha512"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--nextPart2589319.nCAbQjUXP7
Content-Type: multipart/mixed; boundary="nextPart3872662.RIWBHytHhd"; protected-headers="v1"
Content-Transfer-Encoding: 7Bit
From: Sven Eckelmann <sven@narfation.org>
To: "Ivan T. Ivanov" <iivanov@suse.de>, Loic Poulain <loic.poulain@linaro.org>
Cc: linux-serial@vger.kernel.org, linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: msm_serial: ipq4019: RX polling repeats up to 3 old input values
Date: Mon, 01 Nov 2021 00:07:09 +0100
Message-ID: <4119639.d4o71su6xY@sven-desktop>

This is a multi-part message in MIME format.

--nextPart3872662.RIWBHytHhd
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

when using KGDB on an IPQ4019 based system (qcom,msm-uartdm-v1.4), it was 
noticed that communication over serial always breaks when starting kgdb not 
over sysrq+g.

The kgdboc was initialized using on the default console via:

    echo ttyMSM0,115200 > /sys/module/kgdboc/parameters/kgdboc

After doing this, it was possible to switch to kgdb (in screen session) using:

    <ctrl-a> <b> <g>

And it was also possible to switch back to linux via:

    $c#63

It can be seen in a backtrace taken by gdb-multiarch attached via agent-proxy 
(which also uses sysrq+g) that the msm_complete_rx_dma was used to trigger 
the sysrq handler:

    #0  arch_kgdb_breakpoint () at kernel/debug/debug_core.c:1138
    #1  kgdb_breakpoint () at kernel/debug/debug_core.c:1138
    #2  0xc0613bf4 in __handle_sysrq (key=103, check_mask=true) at drivers/tty/sysrq.c:556
    #3  0xc062f9b0 in uart_handle_sysrq_char (ch=<optimized out>, port=<optimized out>) at ./include/linux/serial_core.h:469
    #4  msm_complete_rx_dma (args=0xc0c22b70) at drivers/tty/serial/msm_serial.c:585
    #5  0xc05f75ac in dmaengine_desc_callback_invoke (result=<optimized out>, cb=<optimized out>) at drivers/dma/dmaengine.h:137
    #6  dmaengine_desc_callback_invoke (result=0x0, cb=<optimized out>) at drivers/dma/dmaengine.h:124
    #7  vchan_complete (arg=19) at drivers/dma/virt-dma.c:107
    #8  0xc03253f4 in tasklet_action_common (tl_head=0x13, softirq_nr=0, a=<optimized out>) at kernel/softirq.c:523
    #9  0xc0302288 in __do_softirq () at kernel/softirq.c:292
    #10 0xc03257dc in do_softirq_own_stack () at ./include/linux/interrupt.h:554
    #11 invoke_softirq () at kernel/softirq.c:380
    #12 irq_exit () at kernel/softirq.c:413
    #13 0xc036b800 in __handle_domain_irq (domain=0xcf810000, hwirq=0, lookup=true, regs=0xc0c05914) at kernel/irq/irqdesc.c:684
    #14 0xc05b2ed8 in handle_domain_irq (regs=<optimized out>, hwirq=<optimized out>, domain=<optimized out>) at ./include/linux/irqdesc.h:174
    #15 gic_handle_irq (regs=0xc0c01f28) at drivers/irqchip/irq-gic.c:364


Most things seem to work as expected from this context. But when stopping the 
system via a breakpoint, the communication with kgdb will just break down. The 
gdbstub will only report checksum errors as answer to gdb by printing "-".

This can seen even easier without an attached gdb by manually switching to 
kgdb without going through msm_complete_rx_dma (+uart_handle_sysrq_char). 
Instead use on the command line the file based sysrq-like trigger:

    echo g > /proc/sysrq-trigger

When inspecting the msm_poll_get_char_dm function in both situation it became 
somewhat obvious that:

* in msm_complete_rx_dma context

  - first read character (independent of what I type) is retrieved as 0x00
  - first read character is read from "Or if FIFO is empty" branch which got a 
    count of 1 from UARTDM_RXFS
  - immediately after the first read character, the actually transferred 
    character is retrieved by "Or if FIFO is empty" branch which got a count 
    of 1 from UARTDM_RXFS
  - every later transferred character is retrieved directly by "Or if FIFO is 
    empty" branch which got a count of 1 from UARTDM_RXFS

* in sysrq-trigger context

  - first pressed character (independent of what I type) is retrieved as \r 
    (0x0d)
  - first read character is read from "Or if FIFO is empty" branch which got a 
    count of 1 from UARTDM_RXFS
  - when a second character is transferred, the 0x0d is retrieved (again and 
    again) from "Or if FIFO is empty" branch which got a count of 1 from 
    UARTDM_RXFS
  - when a third character is transferred, the 0x0d is retrieved (again and 
    again) from "Or if FIFO is empty" branch which got a count of 2 from 
    UARTDM_RXFS. A character 0x00 is retrieved after 0x0d from "Check if a 
    previous read had more than one char" branch
  - when a forth character is transferred, the 0x0d is retrieved (again and 
    again) from "Or if FIFO is empty" branch which got a count of 3 from 
    UARTDM_RXFS. 2x 0x00 is retrieved after 0x0d from "Check if a previous 
    read had more than one char" branch
  - when a fifth character is transferred, the "FIFO has a word" branch is 
    finally able to retrieve a count of 4 from UARTDM_RF. This branch + "Check 
    if a previous read had more than one char" are then retrieving the
    previously pressed 4(!!!!) characters - missing the first one
  - the first pressed character is now again and again retrieved by "Or if 
    FIFO is empty" branch which got a count of 1 from UARTDM_RXFS
  - what follows afterwards is hard to explain - so just have a look at the 
    pseudo code below


So from a consumer perspective, the output from the polling function for the 
input "1234567890abcdefg" would look like the output of following pseudo code:

* in msm_complete_rx_dma context

       while wait_for_input:
           pass

       print('\0')
       print('1')

       for t in "234567890abcdefg": 
           while wait_for_input:
               pass

           print(t)

* in sysrq-trigger context

       while wait_for_input:
           pass

       while wait_for_input:
           print('\r')

       while wait_for_input:
           print('\r')
           print('\0')

       while wait_for_input:
           print('\r')
           print('\0')
           print('\0')

       print('2')
       print('3')
       print('4')
       print('5')

       while wait_for_input:
           print(1)

       while wait_for_input:
           print('1')
           print('\0')

       while wait_for_input:
           print('1')
           print('\0')
           print('\0')

       print('6')
       print('7')
       print('8')
       print('9')

       while wait_for_input:
           print('2')

       while wait_for_input:
           print('2')
           print('5')

       while wait_for_input:
           print('2')
           print('4')
           print('5')

       print('0')
       print('a')
       print('b')
       print('c')

       while wait_for_input:
           print('6')

       while wait_for_input:
           print('6')
           print('9')

       while wait_for_input:
           print('6')
           print('8')
           print('9')

       print('d')
       print('e')
       print('f')
       print('g')

I would love to tell you that I am joking - unfortunately, I am not. I have 
also tried the driver from commit 8b374399468d ("serial: msm_serial: Fix kgdb 
continue") and could see that it worked fine. So I've bisected it:

    # bad: [fd80923202c6bfd723742fc32426a7aa3632abaa] Linux 5.4.143
    # good: [8b374399468da1c25db5b5d436b167aafc10fbdc] serial: msm_serial: Fix kgdb continue
    git bisect start 'v5.4.143' '8b374399468da1c25db5b5d436b167aafc10fbdc' '--' 'drivers/tty/serial/msm_serial.c' 'drivers/tty/serial/msm_serial.h'
    # bad: [79c9473f115f99906b6ae443708b8ece480e2e88] tty: msm_serial: remove static clk rate setting in probe
    git bisect bad 79c9473f115f99906b6ae443708b8ece480e2e88
    # good: [4daba33466a81197e65c1a86cc1e1d1ca4e70939] tty: serial: msm_serial: code cleanup in msm_console_setup
    git bisect good 4daba33466a81197e65c1a86cc1e1d1ca4e70939
    # good: [558abdb05fe0c7fc86eba8803d74bc9592c3cb26] tty: serial: msm: Add msm prefix to all driver functions
    git bisect good 558abdb05fe0c7fc86eba8803d74bc9592c3cb26
    # bad: [99693945013a5178e1944f9409a1527d80b33abc] tty: serial: msm: Add RX DMA support
    git bisect bad 99693945013a5178e1944f9409a1527d80b33abc
    # good: [3a878c430fd6eb4f8587f9ebd187f773bf85d1d6] tty: serial: msm: Add TX DMA support
    git bisect good 3a878c430fd6eb4f8587f9ebd187f773bf85d1d6
    # first bad commit: [99693945013a5178e1944f9409a1527d80b33abc] tty: serial: msm: Add RX DMA support

    99693945013a5178e1944f9409a1527d80b33abc is the first bad commit
    commit 99693945013a5178e1944f9409a1527d80b33abc
    Author: Ivan T. Ivanov <ivan.ivanov@linaro.org>
    Date:   Wed Sep 30 15:27:02 2015 +0300
    
        tty: serial: msm: Add RX DMA support
        
        Add receive DMA support for UARTDM type of controllers.
        
        Tested on APQ8064, which have UARTDM v1.3 and ADM DMA engine
        and APQ8016, which have UARTDM v1.4 and BAM DMA engine.
        
        Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
        Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
    
     .../devicetree/bindings/serial/qcom,msm-uartdm.txt |   3 +
     drivers/tty/serial/msm_serial.c                    | 232 ++++++++++++++++++++-
     drivers/tty/serial/msm_serial.h                    |   4 +
     3 files changed, 236 insertions(+), 3 deletions(-)


Simply disabling msm_start_rx_dma seems to work around the problem:

@@ -442,6 +626,9 @@ static void msm_start_rx_dma(struct msm_port *msm_port)
 	u32 val;
 	int ret;
 
+	if (IS_ENABLED(CONFIG_CONSOLE_POLL))
+		return;
+
 	if (!dma->chan)
 		return;
 

In theory, adjusting UARTDM_DMEN might also be an option. I've just 
demonstrated this with this hack - but it is not that good idea to add it like 
this because the DMA state of the driver + device gets inconsistent. And it 
doesn't sound good to me to run something invasive like dma_unmap_single
in the context of the polling code.

diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
index e0718ee5d42a..182cdd4ebe9f 100644
--- a/drivers/tty/serial/msm_serial.c
+++ b/drivers/tty/serial/msm_serial.c
@@ -1423,10 +1423,19 @@ static int msm_poll_get_char_single(struct uart_port *port)
 
 static int msm_poll_get_char_dm(struct uart_port *port)
 {
+	struct msm_port *msm_port = UART_TO_MSM(port);
+	struct msm_dma *dma = &msm_port->rx_dma;
 	int c;
 	static u32 slop;
 	static int count;
 	unsigned char *sp = (unsigned char *)&slop;
+	u32 val;
+
+	if (dma->count) {
+		val = msm_read(port, UARTDM_DMEN);
+		val &= ~dma->enable_bit;
+		msm_write(port, val, UARTDM_DMEN);
+	}
 
 	/* Check if a previous read had more than one char */
 	if (count) {


At the moment, such a code would basically break the RX after kgdb returned 
the control back to Linux (when RX dma was enabled).

Kind regards,
	Sven

--nextPart3872662.RIWBHytHhd
Content-Disposition: attachment; filename="debug-hack.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="debug-hack.patch"

diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
index 3efb80f511db..4dde02f4317f 100644
--- a/drivers/tty/serial/msm_serial.c
+++ b/drivers/tty/serial/msm_serial.c
@@ -1197,15 +1197,21 @@ static int msm_poll_get_char_single(struct uart_port *port)
 	return msm_read(port, rf_reg) & 0xff;
 }
 
+static void msm_poll_put_char(struct uart_port *port, unsigned char c);
 static int msm_poll_get_char_dm(struct uart_port *port)
 {
 	int c;
 	static u32 slop;
 	static int count;
 	unsigned char *sp = (unsigned char *)&slop;
+	static const char x[] = {
+		'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b',
+		'c', 'd', 'e', 'f',
+	};
 
 	/* Check if a previous read had more than one char */
 	if (count) {
+		msm_poll_put_char(port, 'Q');
 		c = sp[sizeof(slop) - count];
 		count--;
 	/* Or if FIFO is empty */
@@ -1217,10 +1223,13 @@ static int msm_poll_get_char_dm(struct uart_port *port)
 		count = msm_read(port, UARTDM_RXFS);
 		count = (count >> UARTDM_RXFS_BUF_SHIFT) & UARTDM_RXFS_BUF_MASK;
 		if (count) {
+			msm_poll_put_char(port, 'R');
+			msm_poll_put_char(port, '0' + count);
 			msm_write(port, UART_CR_CMD_FORCE_STALE, UART_CR);
 			slop = msm_read(port, UARTDM_RF);
 			c = sp[0];
 			count--;
+
 			msm_write(port, UART_CR_CMD_RESET_STALE_INT, UART_CR);
 			msm_write(port, 0xFFFFFF, UARTDM_DMRX);
 			msm_write(port, UART_CR_CMD_STALE_EVENT_ENABLE,
@@ -1230,12 +1239,21 @@ static int msm_poll_get_char_dm(struct uart_port *port)
 		}
 	/* FIFO has a word */
 	} else {
+		msm_poll_put_char(port, 'F');
 		slop = msm_read(port, UARTDM_RF);
 		c = sp[0];
 		count = sizeof(slop) - 1;
 	}
 
-	return c;
+	if (c != NO_POLL_CHAR) {
+		msm_poll_put_char(port, ':');
+		msm_poll_put_char(port, x[c >> 4]);
+		msm_poll_put_char(port, x[c & 0xf]);
+		msm_poll_put_char(port, '\r');
+		msm_poll_put_char(port, '\n');
+	}
+
+	return NO_POLL_CHAR;
 }
 
 static int msm_poll_get_char(struct uart_port *port)

--nextPart3872662.RIWBHytHhd--

--nextPart2589319.nCAbQjUXP7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmF/IZ0ACgkQXYcKB8Em
e0YDlA/+KYh6FNo9hbNWWSfCPyNc3ZnsLt1dWBXSGrGrGn/jUqG/05+ZOxAwCNMh
9/D3l8al6Fi4QtRWwmt/sOQkt52cEgYo9gYG6/ytxU00m5DIPv2cLPM9tejDrwup
U8GPC3ky2+e2CqQ3gUygvMegYzykY1omdaSFKAk9v979IWMB3hRw+KjEKQ7CYAJ5
DO4V+r7pDRD7QzUVbiGu0RZjztd9R5APwb+vDcvX2RzVg/5f477EsyIi0sUdGO87
TCjyfBgiqXatZ4DjZQn7m26Zk4ALF0bZ65XMl7pXgKR/8Ak8gDhAt+77VZrAdN6I
BxOUfF7b41OqcpLPcHkBdahxbN580Qc0tjTYCP2KbPnYJNz71VVexM1pQ9JQJ2J1
3PJwSG/BC5KvZ99FJGa+8qBzPALgEKl0ZXmXvZVGyOR76BvfBgqQvrDjpE6e1ykl
+nf8h/2+kRwMrtHfTeQS4slRtMVOXXiRxyejdElS+6vUyHMNqdUCt6qkfvfhB20g
UK8E0+d3ymzNfsT3/eQjtf6Ttr+eFU9JFfAVfh3F8pRBwMF1K/t1EtgKI9HekKsy
82ujMTbgVrogSUi/H3vAu/tJfR/Bww8OS+4kwE5PMyMM2a0QZTfC9H7cj5bC//Iq
N6Cte83YOXC1j+oYsDT2FUThy15ZYTvMPIYYXUS24A6fUR5UdXs=
=7jbU
-----END PGP SIGNATURE-----

--nextPart2589319.nCAbQjUXP7--



